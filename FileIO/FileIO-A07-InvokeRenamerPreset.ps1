param (
    [Parameter(Mandatory,ValueFromPipeline)]
    [String] $FileList,
    [Parameter(Mandatory)]
    [String] $PresetName,
    [Switch] $UI,
    [Int32] $ThrottleLimit = 16
)

### TODO: Split FileList into batches of 1000 and process in parallel.

try {
    $CmdRenamer = Get-Command 'C:\Program Files (x86)\ReNamer\ReNamer.exe' -ErrorAction Stop
} catch {
    Remove-Item $FileList -Force
    Write-Error "Can't find Renamer."
    throw $_
}


$Mode = ($UI) ? "/preset" : "/rename"
$Params = $Mode, $PresetName, "/list", $FileList
& $CmdRenamer $Params | Out-Null

Remove-Item $FileList -Force

if(!$UI){
    $ToastM1	= 'Operation Complete'
    $ToastM2	= 'All files have been renamed.'
    $ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-rename-1.png"

    $Builder =  New-BTContentBuilder
    $Builder |  Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
                Add-BTText -Text $ToastM1 -PassThru |
                Add-BTText -Text $ToastM2

    $Builder |  Show-BTNotification
}
