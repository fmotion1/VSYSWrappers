param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('png','jpg','jpeg','gif','gifnomatte','tif','bmp','bmp3','webp',IgnoreCase=$true)]
    [String]
    $DestFormat

)

$Files = Get-Content $FileList

# $Files | Convert-RasterToRaster -DestFormat $DestFormat
Convert-RasterToRaster -Files $Files -DestFormat $DestFormat

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification
