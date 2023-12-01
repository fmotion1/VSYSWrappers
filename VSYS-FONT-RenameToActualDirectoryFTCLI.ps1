param (
    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [ValidateSet('1','2','3')]
    [Int32]
    $Method,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

& "D:\Dev\Python\00 VENV\FontTools\Scripts\Activate.ps1"

$Folders = Get-Content $FileList

if(!$Method){
    $OokiiSplat = @{
        MainInstruction = "Please specify the how to extract the file names"
        MainContent     = "[1] FamilyName-StyleName [2] PostScript Name [3] Full Font Name"
        WindowTitle     = "ftCLI Font Renamer"
        InputText       = '1'
    }

    while($true){
        $Result = Invoke-OokiiInputDialog @OokiiSplat
        if($Result[1] -eq 'Cancel'){
            exit 2
        }
        $SourceMethod = $Result[0]
        if ($SourceMethod -eq '1') { break }
        if ($SourceMethod -eq '2') { break }
        if ($SourceMethod -eq '3') { break }
    }
} else {
    $SourceMethod = '3'
}

foreach ($Folder in $Folders) {

    Write-SpectreHost -Message "Processing [white]$Folder[/]..."

    $Files = Get-ChildItem -LiteralPath $Folder -File -Recurse |
                Where-Object { ($_.Extension -eq '.otf') -or ($_.Extension -eq '.ttf') }

    Write-SpectreHost -Message "Found [white]$($Files.Length)[/] fonts to process."

    $Files | ForEach-Object -Parallel {
        $File = $_
        $cmd = Get-Command "D:\Dev\Python\00 VENV\FontTools\Scripts\ftcli.exe"
        & $cmd utils font-renamer -s $Using:SourceMethod $File
    } -ThrottleLimit $MaxThreads
}

Remove-Item $FileList -Force

$ToastM1	= 'Font Renaming Complete.'
$ToastM2	= 'All files have been successfully renamed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-font-general.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification