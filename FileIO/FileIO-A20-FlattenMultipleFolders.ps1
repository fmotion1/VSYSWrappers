param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $Force
)

$Files = Get-Content $FileList
Merge-FlattenDirectory -InputPath $Files -Force:$Force

Remove-Item $FileList -Force
Request-ExplorerRefresh

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All directories have been successfully flattened.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification