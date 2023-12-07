param (
    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

$List = Get-Content $FileList

$List | ForEach-Object -Parallel {

    $File = $_.Replace('`[', '[')
    $File = $File.Replace('`]', ']')

    $OriginalDirectory     = Get-FilePathComponent $File -Component Folder
    $OriginalFilenameNoExt = Get-FilePathComponent $File -Component FileBase

    $OutputFolder = Join-Path $OriginalDirectory "Cropped"

    if(!(Test-Path -LiteralPath $OutputFolder -PathType Container)){
        New-Item -ItemType Directory -Path $OutputFolder -Force | Out-Null
    }

    $OutputFilename = $OriginalFilenameNoExt + ".png"
    $OutputFilePath = Join-Path $OutputFolder $OutputFilename

    $DestFile = $OutputFilePath
    $IDX = 2
    $PadIndexTo = '1'
    $StaticFilename = Get-FilePathComponent $DestFile -Component FullPathNoExtension
    $FileExtension  = Get-FilePathComponent $DestFile -Component FileExtension
    while (Test-Path -LiteralPath $DestFile -PathType Leaf) {
        $DestFile = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
        $IDX++
    }

    & magick $File -trim +repage png32:$DestFile | Out-Null

} -ThrottleLimit $MaxThreads


Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification