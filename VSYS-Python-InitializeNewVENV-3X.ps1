param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $Folder,

    [Parameter(Mandatory)]
    [String]
    $Version
)

Set-Location -LiteralPath $Folder

$i = Get-ChildItem -Path $Folder
if ($i.Count -ne 0) {
    throw [System.Exception] "The target folder is not empty."
    exit
}

py -$Version -m venv $Folder | Out-Null

& "Scripts/Activate.ps1" | Out-Null










