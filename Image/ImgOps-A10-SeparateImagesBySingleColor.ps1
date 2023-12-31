param (
    [Parameter(Mandatory)]
    [String]
    $FileList
)

$Files = Get-Content $FileList


# Dialog Splat
$invokeOokiiInputDialogSplat = @{
    MainInstruction = "Specify a HEX Color"
    MainContent = "Please input a HEX formatted color code."
    WindowTitle = "Input Color"
    InputText = "#FFFFFF"
    MaxLength = 7
}


$DialogResponse = Invoke-OokiiInputDialog @invokeOokiiInputDialogSplat
$ChosenColor = $DialogResponse[0]
while ($ChosenColor -inotmatch '^#([0-9a-f]{3}|[0-9a-f]{6})$') {
    $DialogResponse = Invoke-OokiiInputDialog @invokeOokiiInputDialogSplat
    $ChosenColor = $DialogResponse[0]
}
if(!$ChosenColor){
    return
}

Group-ImagesBySingleColor -Files $Files -HexColor $ChosenColor

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification