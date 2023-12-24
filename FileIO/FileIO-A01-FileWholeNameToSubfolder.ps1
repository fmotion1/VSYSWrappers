param (
    [Parameter(Mandatory)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

try {
    Save-FontsToFolderByWord -Files $Files -WholeName
} catch {
    Remove-Item $FileList -Force
    $PSCmdlet.ThrowTerminatingError($PSItem)
}

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All fonts have been separated.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-font-general.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification

