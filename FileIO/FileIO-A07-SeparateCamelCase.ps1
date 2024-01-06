param (
    [Parameter(Mandatory,Position=0)]
    [String] $FileList,
    [Switch] $ProcessFolderContents,
    [Int32] $MaxThreads = 16
)

$Files = Get-Content $FileList

try {
    $renameSeparatePascalCaseSplat = @{
        Files = $Files
        ProcessFolderContents = $ProcessFolderContents
        MaxThreads = $MaxThreads
    }
    Rename-SeparatePascalCase @renameSeparatePascalCaseSplat
}catch {
    Remove-Item $FileList -Force
    throw
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification