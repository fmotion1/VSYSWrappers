param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $Folder,

    [Parameter(Mandatory=$false)]
    [String]
    $Version='3.11'
)

Set-Location -LiteralPath $Folder

$i = Get-ChildItem -Path $Folder
if ($i.Count -ne 0) {
    throw [System.Exception] "The target folder is not empty."
    exit
}

py -$Version -m venv $Folder | Out-Null

& "Scripts/Activate.ps1" | Out-Null

pip install brotli
pip install skia-pathops
pip install PyQt5
pip install reportlab
pip install freetype-py
pip install fonttools[ufo,lxml,woff,unicode,pathops]
pip install font-cli
pip install numpy
pip install fs
pip install unicodedata2
pip install scipy
pip install uharfbuzz
pip install opentypesvg
pip install fontmeta
pip install python-fontbro
pip install fonttoolsWB












