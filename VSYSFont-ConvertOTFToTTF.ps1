param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

$Files | Convert-FontOTFToTTF
# Convert-FontOTFToTTF -Files $Files

Remove-Item $FileList -Force

$ToastM1    = 'OTF to TTF Conversion Complete.'
$ToastM2    = 'All files have been successfully converted.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-font-general.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification