param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

# $Files | Convert-ImageToMetadataIdentify
Convert-ImageToMetadataIdentify -Files $Files

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification