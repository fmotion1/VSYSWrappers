param (
    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $OverwriteFiles
)

$Files = Get-Content $FileList

$invokeOokiiInputDialogSplat = @{
    MainInstruction = "Specify Sizes"
    MainContent = "Please input a comma separated list of sizes you want to generate."
    WindowTitle = "Conversion Sizes"
    InputText = "16,24,28,32"
    MaxLength = 40
}

$Response = Invoke-OokiiInputDialog @invokeOokiiInputDialogSplat
$SizeList = $Response[0]
while ($SizeList -inotmatch '[0-9]+(,[0-9]+)*') {
    $Response = Invoke-OokiiInputDialog @invokeOokiiInputDialogSplat
    $SizeList = $Response[0]
}

$SizeArr = $SizeList.Split(",")

try {
    Convert-SVGToPNGBySize -Files $Files -Sizes $SizeArr -OverwriteFiles:$OverwriteFiles
} catch {
    Remove-Item $FileList -Force
    throw
}

Remove-Item $FileList -Force

$ToastM1	= 'Image Conversion Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification