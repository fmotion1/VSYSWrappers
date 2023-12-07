param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $Folder,

    [Parameter(Mandatory=$false)]
    [String]
    $Version='3.11'
)

Push-Location -LiteralPath $Folder -StackName InitVENV

$i = Get-ChildItem -Path $Folder
if ($i.Count -ne 0) {
    throw [System.Exception] "The target folder is not empty."
    exit
}

Write-SpectreHost "Initializing the virtual environment."
py -$Version -m venv $Folder | Out-Null
& "Scripts/Activate.ps1"

Write-SpectreHost "Installing [white]Image Dominant Colors[/] VENV Dependencies."

python -m pip install --upgrade pip
python -m pip install Pillow
python -m pip install matplotlib
python -m pip install PyWavelets
python -m pip install scikit-image
python -m pip install scikit-learn
python -m pip install colorthief
python -m pip install opencv-python
python -m pip install colorama
python -m pip install colorclass
python -m pip install pandas

Write-Host "Installation Complete.`n" -ForegroundColor White
Write-Host -NoNewLine 'Press any key to exit.'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')








