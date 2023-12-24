param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

# $Files | Convert-FontToTTXXML
Convert-FontToTTXXML -Files $Files

Remove-Item $FileList -Force

$ToastM1    = 'TTX Conversion Complete.'
$ToastM2    = 'All files have been successfully converted.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-font-general.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification