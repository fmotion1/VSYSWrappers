param (
    [Parameter(Mandatory)]
    [String]
    $FileList
)

$Files = Get-Content $FileList


# Dialog Splat
$DialogVars = @{
    MainInstruction = "Specify HTML HEX Color"
    MainContent = "Please input a valid color in HTML Hex format."
    WindowTitle = "Input Color"
    InputText = "#179CE1"
    MaxLength = 7
}

# Collect the color to sort by.
[array]$DialogResponse = Invoke-OokiiInputDialog @DialogVars
$UserColor = $DialogResponse[1]
if(!$UserColor) { exit }
Write-Host "`$UserColor:" $UserColor -ForegroundColor Green
while ($UserColor -inotmatch '^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$') {
    if(!$UserColor) { break; exit }
    [array]$DialogResponse = Invoke-OokiiInputDialog @DialogVars
    $UserColor = $DialogResponse[1]
}

# If the user omitted the # sign, add it.
if($UserColor -notmatch "#"){ $UserColor = "#$UserColor" }


Write-Host "`$UserColor:" $UserColor -ForegroundColor Green

Group-ImagesBySingleColor -Files $Files -HexColor $UserColor

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification