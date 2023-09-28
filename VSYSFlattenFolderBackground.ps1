param (
    [Parameter(Mandatory)]
    [String]
    $Folder,

    [Parameter(Mandatory=$false)]
    [Switch]
    $Force
)

Merge-FlattenDirectory -InputPath $Folder -Force:$Force
Request-ExplorerRefresh

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All directories have been successfully flattened.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification