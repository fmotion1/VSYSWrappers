param (
    [Parameter(Mandatory, Position=0)]
    [String]
    $File
)


$NewFilePath = "\\?\$File"

$Params = @{
    Message = "Are you sure you want to delete $($File)?"
    Title = "Delete Confirmation"
    BoxType = "YesNoCancel"
    Icon = "Exclamation"
}

$Result = Invoke-VBMessageBox @Params

if($Result -ne "Yes"){ exit }

# /C        Carries out the command specified by string and then terminates
# del /F    Force deleting of read-only files.
# del /Q    Quiet mode, do not ask if ok to delete on global wildcard
# del /A    Selects files to delete based on attributes


& cmd /C del /F /Q $NewFilePath