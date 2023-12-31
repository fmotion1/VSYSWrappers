param (
    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int]
    $NumWords = 1
)

$Files = Get-Content $FileList

try {
    Save-FolderToSubfolderByWord -Folders $Files -NumWords $NumWords
} catch {
    Remove-Item $FileList -Force
    $PSCmdlet.ThrowTerminatingError($PSItem)
}

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have been saved to new folders.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-folder-general-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification