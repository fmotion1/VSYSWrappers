param (
    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $NumWords = 1
)

$Files = Get-Content $FileList

try {
    Save-FontsToFolderByWord -Files $Files -NumWords $NumWords
} catch {
    Remove-Item $FileList -Force
    throw
}

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All fonts have been separated.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-font-general.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification