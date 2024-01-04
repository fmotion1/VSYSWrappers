param (
    [Parameter(Mandatory)]
    [String] $FileList,
    [double] $Threshold = 0.005,
    [Int32] $MaxThreads = 16,
    [ValidateSet('All','png','jpg','jpeg','gif','bmp','webp','tif','tiff','svg', IgnoreCase = $true)]
    [String] $Filter = 'All'
)

$Images = Get-Content $FileList

try {

    $removeInvalidPlainTextImagesSplat = @{
        Files      = $Images
        Threshold  = $Threshold
        Filter     = $Filter
        MaxThreads = $MaxThreads
    }

    Remove-InvalidPlainTextImages @removeInvalidPlainTextImagesSplat

} catch {
    Remove-Item $FileList -Force
    throw
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
