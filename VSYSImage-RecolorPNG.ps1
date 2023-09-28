param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

$IDialogArgs = @{
    MainInstruction = "Specify Fill Color"
    MainContent     = "Please input a HEX formatted color code for the fill color."
    WindowTitle     = "Input Color"
    InputText       = "#000000"
    MaxLength       = 7
}

$DialogResponse = Invoke-OokiiInputDialog @IDialogArgs
$ReplacementHex = $DialogResponse[0]
while ($ReplacementHex -inotmatch '^#([0-9a-f]{3}|[0-9a-f]{6})$') {
    $DialogResponse = Invoke-OokiiInputDialog @IDialogArgs
    $ReplacementHex = $DialogResponse[0]
}
if(!$ReplacementHex){
    return
}

$ReplacementHex = "$ReplacementHex"

Write-Host "`$ReplacementHex:" $ReplacementHex -ForegroundColor Green
# $Files | Convert-RecolorPNG -NewColor $ReplacementHex
Convert-RecolorPNG -Files $Files -NewColor $ReplacementHex

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification