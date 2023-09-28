param (
    [Parameter(Mandatory,Position=0)]
    [Alias("f")]
    $Folder
)

$ClipboardContent = Get-Clipboard -Raw
$DestFile = [System.IO.Path]::Combine($Folder, "Pasted Content.txt")

$IDX = 2
$PadIndexTo = '1'
$StaticFilename = Get-FilePathComponent $DestFile -Component FullPathNoExtension
$FileExtension  = Get-FilePathComponent $DestFile -Component FileExtension
while (Test-Path -LiteralPath $DestFile -PathType Leaf) {
    $DestFile = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
    $IDX++
}

Set-Content -LiteralPath $DestFile -Value $ClipboardContent



