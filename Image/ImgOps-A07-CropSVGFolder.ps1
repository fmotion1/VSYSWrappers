param (
    [Parameter(Mandatory)]
    [String] $FileList,
    [Switch] $RenameOutput,
    [Switch] $PlaceInSubfolder,
    [Int32] $MaxThreads = 16
)

$Files = Get-Content $FileList

try {
    
    $convertCropSVGInkscapeFolderSplat = @{
        LiteralPath = $Files
        RenameOutput = $RenameOutput
        PlaceInSubfolder = $PlaceInSubfolder
        MaxThreads = $MaxThreads
    }

    Convert-CropSVGInkscapeFolder @convertCropSVGInkscapeFolderSplat

} catch {
    Remove-Item $FileList -Force
    Write-Error "An error occured."
    throw $_
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification
