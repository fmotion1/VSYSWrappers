param (
    [Parameter(Mandatory,ValueFromPipeline)]
    $WorkingDirectory,

    [Parameter(Mandatory=$false)]
    [Switch]
    $NoSaveDialog
)

$B64String = Get-Clipboard -Raw
if([String]::IsNullOrWhiteSpace($B64String)){
    Invoke-VBMessageBox -Message "Base64 String (From clipboard) is empty."
    exit
}

Write-Host "Beginning Replacement" -ForegroundColor White
$FinalB64 = $B64String -split ',', 2 | Select-Object -Last 1


try {
    [System.Convert]::FromBase64String($FinalB64) | Out-Null
}
catch {
    $MBParams = @{
        Message       = "The Base64 string is invalid or malformed."
        Title         = "Invalid Base64 String"
        Icon          = "Critical"
        BoxType       = "OKOnly"
    }
    Invoke-VBMessageBox @MBParams
    throw [System.IO.IOException] "Base64 String is Invalid."
}

$DestFile = [System.IO.Path]::Combine($WorkingDirectory, 'file.woff')
$IDX = 2
$PadIndexTo = '1'
$StaticFilename = Get-FilePathComponent $DestFile -Component FullPathNoExtension
$FileExtension  = Get-FilePathComponent $DestFile -Component FileExtension
while (Test-Path -LiteralPath $DestFile -PathType Leaf) {
    $DestFile = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
    $IDX++
}

$DefaultFName = [System.IO.Path]::GetFileName($DestFile)

if(!$NoSaveDialog){
    $Result = Invoke-SaveFileDialog -Path $WorkingDirectory -DefaultFileName $DefaultFName
    Convert-Base64StringToFile -Base64String $FinalB64 -FilePath $Result -Force
}else{
    $Dest = [System.IO.Path]::Combine($WorkingDirectory, $DefaultFName)
    Convert-Base64StringToFile -Base64String $FinalB64 -FilePath $Dest -Force
}


