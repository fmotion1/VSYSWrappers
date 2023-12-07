param(
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('OBJ','FBX',IgnoreCase = $true)]
    [String]
    $DestFormat
)

$Files = Get-Content $FileList

foreach ($File in $Files) {
    $NewFile = [System.IO.Path]::ChangeExtension($File, $DestFormat)
    Write-Host "Processing $File..."

    try {
        $MAYO = Get-Command mayo.exe
    }catch {
        Write-Error "Fougue Mayo can't be found. Get it here: https://github.com/fougue/mayo/releases"
        throw "Mayo.exe can't be located. Make sure it's available in PATH."
    }

    $MAYOParams = $File, '--export', $NewFile
    & $MAYO $MAYOParams | Out-Null
    
    Write-Host "Finished."
}

Remove-Item $FileList -Force


