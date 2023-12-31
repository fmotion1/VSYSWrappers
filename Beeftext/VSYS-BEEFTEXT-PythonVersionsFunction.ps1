function Get-PythonVersionsBeeftext {

    [CmdletBinding(DefaultParameterSetName = 'All')]
    param (

        [Parameter(Mandatory=$false, HelpMessage="Display only Paths")]
        [Parameter(Mandatory, ParameterSetName='VersionOnly', HelpMessage="Display only Paths")]
        [switch]
        $PathOnly,

        [Parameter(Mandatory=$false, HelpMessage="Display only Versions")]
        [Parameter(Mandatory, ParameterSetName='VersionAndPath', HelpMessage="Display only versions")]
        [switch]
        $VersionOnly,

        [Parameter(Mandatory=$false, HelpMessage="Filter results by major release version")]
        [ValidateSet('3','2','ALL', IgnoreCase = $true)]
        [String]
        $FilterVersion = 'ALL'
    )

    ## Parameter Validation
    if($PathOnly -and $VersionOnly){
        Write-Error "PathOnly and VersionOnly cannot be used together."
        return
    }

    if($GetLatestOnly -and $GetOldestOnly){
        Write-Error "GetLatestOnly and GetOldestOnly cannot be used together."
        return
    }

    # Initialize Variables to store Python Launcher results
    $PYLauncherCMD = Get-Command py.exe
    $pythonObjects = [System.Collections.Generic.List[Object]]@()
    $PY1 = (& $PYLauncherCMD -0) -split "\r?\n"
    $PY2 = (& $PYLauncherCMD -0p) -split "\r?\n"

    # Parser for Python Launcher results
    for ($idx = 0; $idx -lt $PY1.Count; $idx++) {

        $pyVersion = ''
        $pyLabel   = ''
        $pyPath    = ''

        $line = $PY1[$idx] -replace '\* ', ''
        $parts = -split $line
        $pyVersion = $parts[0] -replace '\-V:',''

        $pyVersionMajor = ($pyVersion -split '\.')[0]
        if(($FilterVersion -eq '3') -and $pyVersionMajor -eq '2'){
            continue
        }
        elseif(($FilterVersion -eq '2') -and $pyVersionMajor -eq '3'){
            continue
        }

        $pyLabel = ($parts[1] + ' ' + $parts[2] + ' ' + $parts[3]).Trim()

        $line = $PY2[$idx] -replace '\* ', ''
        $parts = -split $line
        $finalPath = ''
        $pathIdx = 0
        $parts | ForEach-Object {
            if($pathIdx -ne 0) { $finalPath += $($_ + ' ') }
            $pathIdx++
        }
        $pyPath = $finalPath

        $Results = [PSCustomObject]@{
            Label   = $pyLabel
            Path    = $pyPath
        }

        $pythonObjects.Add($Results)
    }

    if($PathOnly){
        $pythonObjects | ForEach-Object { $_.Path }
    }
    elseif($VersionOnly){
        $pythonObjects | ForEach-Object { $_.Label }
    }else{
        $pythonObjects
    }
}                              


