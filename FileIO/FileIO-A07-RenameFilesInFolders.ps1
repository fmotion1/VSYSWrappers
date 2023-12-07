param (
    [Parameter(Mandatory)]
    [Alias("f")]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [String]
    $PresetName
)

$Folders = Get-Content $FileList

try {
    #Write-Host "`$Folders:" $Folders -ForegroundColor Green
    Rename-FilesInFolder -Folders $Folders -PresetName $PresetName

} catch {
    Remove-Item $FileList -Force
    $ToastM1	= 'Operation Failed'
    $ToastM2	= 'An error occured while running this script.'
    $ToastImage = "$PSScriptRoot\images\Toast\toast-error-x-color.png"
    $Builder = New-BTContentBuilder
    $Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
            Add-BTText -Text $ToastM1 -PassThru |
            Add-BTText -Text $ToastM2
    $Builder | Show-BTNotification
    throw
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification
