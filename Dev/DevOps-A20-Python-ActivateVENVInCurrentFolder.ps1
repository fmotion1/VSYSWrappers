param (
    [Parameter(Mandatory)]
    [String]
    $Folder
)

$ActivateScript = [System.IO.Path]::Combine($Folder, 'Scripts', 'Activate.ps1')
if(Test-Path $ActivateScript -PathType Leaf){
    & $ActivateScript
    Set-Location $Folder
} else {
    Write-Host "This folder is not a VENV." -ForegroundColor White
}