param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('png','jpg','gif','tif8','tif16','bmp',IgnoreCase=$true)]
    [String]
    $DestFormat,

    [Parameter(Mandatory=$false)]
    [Switch]
    $SaveAllPages,

    [Parameter(Mandatory=$false)]
    [Int32]
    $DPI=300

)

$Files = Get-Content $FileList

$CParams = @{
    DestFormat    = $DestFormat
    SaveAllPages  = $SaveAllPages
    DPI           = $DPI

}

# $Files | Convert-VectorToRaster @CParams
Convert-VectorToRaster -Files $Files @CParams

Remove-Item $FileList -Force

$ToastM1	= 'Image Conversion Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification