param (
    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('otf','ttf', IgnoreCase = $true)]
    [String]
    $Extension,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

Import-Module VSYSFileOps

$ex = $Extension.ToUpper()
$a = "/rename", "Change Exension to $ex", "/list", "$FileList"
& "C:\Program Files (x86)\ReNamer\ReNamer.exe" $a | Out-Null


$Files = Get-Content $FileList

& "$env:PYVENV\FontTools\Scripts\Activate.ps1"

$Files | ForEach-Object -Parallel {

    $NewExtension = ($Using:Extension).ToLower()
    $CurrentFile = Get-FilePathComponent -Path $_ -Component FullPathNoExtension
    $CurrentFile = $CurrentFile + ".$NewExtension"

    $s = "$env:FONTSCRIPTS\get_real_font_name_with_extension.py"
    $RealFontName = & python $s $CurrentFile
    $CurFileName = [System.IO.Path]::GetFileName($CurrentFile)

    if($RealFontName -eq $CurFileName){ return }

    Write-Host "`$CurrentFile:" $CurrentFile -ForegroundColor Green
    Write-Host "`$RealFontName:" $RealFontName -ForegroundColor Green

    $NewFontFull = Join-Path -Path ([System.IO.Path]::GetDirectoryName($CurrentFile)) -ChildPath $RealFontName

    $Index = 2
    $PadIndexTo = '2'
    $StaticFilename = Get-FilePathComponent $NewFontFull -Component FullPathNoExtension
    $FileExtension  = Get-FilePathComponent $NewFontFull -Component FileExtension
    while (Test-Path -LiteralPath $NewFontFull -PathType Leaf) {
        $NewFontFull = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $Index, $FileExtension
        $Index++
    }

    Rename-Item -LiteralPath $CurrentFile -NewName $NewFontFull -Force


} -ThrottleLimit $MaxThreads