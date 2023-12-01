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

python -m pip install brotli
python -m pip install PyQt5
python -m pip install reportlab
python -m pip install foundrytools-cli
python -m pip install freetype-py
python -m pip install uharfbuzz
python -m pip install opentypesvg
python -m pip install fonttools[ufo,lxml,woff,unicode,interpolatable,plot,pathops]
python -m pip install python-fontbro
python -m pip install filetype
python -m pip install PyFontConverter
python -m pip install fontmeta
python -m pip install font-rename
python -m pip install font-line
python -m pip install font-v
python -m pip install fleep









