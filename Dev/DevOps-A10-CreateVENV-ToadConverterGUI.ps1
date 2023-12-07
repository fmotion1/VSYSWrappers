param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $Folder,

    [Parameter(Mandatory=$false)]
    [String]
    $Version='3.10'
)

Set-Location -LiteralPath $Folder

$i = Get-ChildItem -Path $Folder
if ($i.Count -ne 0) {
    throw [System.Exception] "The target folder is not empty."
    exit
}

py -$Version -m venv $Folder | Out-Null

& "Scripts/Activate.ps1" | Out-Null

python.exe -m pip install --upgrade pip

python -m pip install dr-converter










