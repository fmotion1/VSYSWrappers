param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('WOFF','WOFF2','BOTH', IgnoreCase = $true)]
    [String]
    $Flavor
)

$Files = Get-Content $FileList

# $Files | Convert-FontWOFFCompress -Flavor $Flavor
Convert-FontWOFFCompress -Files $Files -Flavor $Flavor

Remove-Item $FileList -Force

$ToastM1	= 'WOFF Compression Complete.'
$ToastM2	= 'All files have been successfully compressed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-font-general.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification