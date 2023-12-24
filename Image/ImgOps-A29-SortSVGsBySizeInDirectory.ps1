param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Folders = Get-Content $FileList

Group-SortSVGsBySizeInDirectory -Directories $Folders

Remove-Item $FileList -Force
Request-ExplorerRefresh

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification

