param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

# $Files | Convert-FontWOFFCompressGoogle
Convert-FontWOFFCompressGoogle -Files $Files

Remove-Item $FileList -Force

$ToastM1	= 'WOFF2 Compression Complete.'
$ToastM2	= 'All files have been successfully compressed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-font-general.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification