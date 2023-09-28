param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$TTCFiles = Get-Content $FileList

& "D:\Dev\Python\00 VENV\FontTools\Scripts\Activate.ps1"
$Script = "$env:FONTSCRIPTS\convert_ttc_2_ttf.py"

try {
    $TTCFiles | ForEach-Object {
        $TTCFile = $_
        & python $Script $TTCFile
    }
} catch {
    Remove-Item $FileList -Force
    throw
}

Remove-Item $FileList -Force

$ToastM1	= 'TTC Extraction Complete.'
$ToastM2	= 'All files have been successfully extracted.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification

