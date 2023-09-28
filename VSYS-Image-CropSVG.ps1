param (
    [Parameter(Mandatory)]
    [Alias("f")]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $RenameOutput,

    [Parameter(Mandatory=$false)]
    [Switch]
    $CleanOutputWithSVGO,

    [Parameter(Mandatory=$false)]
    [Switch]
    $PlaceInSubfolder,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

$Files = Get-Content $FileList

try {

    $SVGCropSplat = @{
        Files                = $Files
        RenameOutput         = $RenameOutput
        CleanOutputWithSVGO  = $CleanOutputWithSVGO
        PlaceInSubfolder     = $PlaceInSubfolder
    }
    Convert-SVGCrop @SVGCropSplat

} catch {
    throw
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification
