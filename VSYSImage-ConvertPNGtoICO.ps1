param (
    [Parameter(Mandatory)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

# $Files | Convert-PNGtoICO -MaxThreads 32
Convert-PNGtoICO -Files $Files -MaxThreads 32

Remove-Item $FileList -Force

$ToastM1	= 'ICO Conversion Complete.'
$ToastM2	= 'All files have been successfully converted.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification

