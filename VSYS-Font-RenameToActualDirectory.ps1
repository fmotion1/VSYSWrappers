param (
    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $Recurse
)

$Files = Get-Content $FileList

try {
    Rename-FontToActualNameDirectory -Directories $Files -Recurse:$Recurse
} catch {
    Remove-Item $FileList -Force
    throw
}

Remove-Item $FileList -Force

$ToastM1	= 'Font Renaming Complete.'
$ToastM2	= 'All files have been successfully renamed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-font-general.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification