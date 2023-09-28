param (
    [Parameter(Mandatory, Position=0)]
    [String]
    $File
)

# \\?\"C:\Users\futur\Desktop\Icons\Test\figma-export-icons\assets"

Write-Host "`$File:" $File -ForegroundColor Green

$NewFilePath = "`"\\?\$File`""

$Params = @{
    Message = "Are you sure you want to delete $($File)?"
    Title = "Delete Confirmation"
    BoxType = "YesNoCancel"
    Icon = "Exclamation"
}

$Result = Invoke-VBMessageBox @Params

if($Result -ne "Yes"){ exit }

& cmd.exe /c del /F /Q /A $NewFilePath