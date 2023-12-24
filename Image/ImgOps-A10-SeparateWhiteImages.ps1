param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

$Files = Get-Content $FileList

$Files | ForEach-Object -Parallel {

    $File = $_

    $RGBValues = magick $File -colorspace rgb -scale 1x1 -format "%[fx:floor(255*r)],%[fx:floor(255*g)],%[fx:floor(255*b)]" info:
    $Eval = $RGBValues.Split(',')

    [int]$R = $Eval[0]
    [int]$G = $Eval[1]
    [int]$B = $Eval[2]

    if(($R -ge 254) -and ($G -ge 254) -and ($B -ge 254)){

        $FileDir = [IO.Path]::GetDirectoryName($File)
        $FileBase = [IO.Path]::GetFileName($File)
        $DestPath = Join-Path $FileDir "White Images"

        if(!(Test-Path -LiteralPath $DestPath -PathType Container)){
            [System.IO.Directory]::CreateDirectory($DestPath)
        }

        $DestFile = Join-Path $DestPath $FileBase

        $IDX = 2
        $PadIndexTo = '1'
        $StaticFilename = Get-FilePathComponent $DestFile -Component FullPathNoExtension
        $FileExtension = Get-FilePathComponent $DestFile -Component FileExtension

        while (Test-Path -LiteralPath $DestFile -PathType Leaf) {
            $DestFile = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
            $IDX++
        }

        [IO.File]::Move($File, $DestFile)

    }

} -ThrottleLimit $MaxThreads

Remove-Item $FileList -Force

$ToastM1	= 'Sort Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification