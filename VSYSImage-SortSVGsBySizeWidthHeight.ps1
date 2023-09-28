param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

Group-SortSVGsBySizeWidthHeight -Files $Files

Remove-Item $FileList -Force

$ToastM1	= 'Sort Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification