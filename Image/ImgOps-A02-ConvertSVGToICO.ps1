param (
    [Parameter(Mandatory,Position=0)]
    [String] $FileList,
    [Switch] $HonorSub16pxSizes,
    [Int32] $MaxThreads = 16
)

$Files = Get-Content $FileList

$convertSVGtoICOSplat = @{
    Files = $Files
    HonorSub16pxSizes = $HonorSub16pxSizes
    MaxThreads = $MaxThreads
}

Convert-SVGtoICO @convertSVGtoICOSplat

Remove-Item $FileList -Force

$ToastM1	= 'SVG Conversion Complete.'
$ToastM2	= 'All files have been successfully converted.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification