param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $NumFilesPerFolder = 1000,

    [Parameter(Mandatory=$false)]
    [Int32]
    $FolderNumberPadding = 2,

    [Parameter(Mandatory=$false)]
    [String]
    $PathPrefix = ''
)


$Folders = Get-Content $FileList

$SplitArgs = @{
    Directories         = $Folders
    NumFilesPerFolder   = $NumFilesPerFolder
    FolderNumberPadding = $FolderNumberPadding
    PathPrefix          = $PathPrefix
}

Group-SplitDirectoryContentsToSubfolders @SplitArgs
Remove-Item $FileList -Force
Request-ExplorerRefresh

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have been successfully split into subfolders.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification
