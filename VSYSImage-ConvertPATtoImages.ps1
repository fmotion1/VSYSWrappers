param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $RenameToFilename
)

$Files = Get-Content $FileList

if($RenameToFilename){
    # $Files | Convert-PATToImages -RenameToFilename
    Convert-PATToImages -Files $Files -RenameToFilename
}else{
    # $Files | Convert-PATToImages
    Convert-PATToImages -Files $Files
}

Remove-Item $FileList -Force

$ToastM1	= "Image Extraction Complete."
$ToastM2	= "All files have been successfully extracted."
$ToastImage = "$PSScriptRoot\images\Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification
