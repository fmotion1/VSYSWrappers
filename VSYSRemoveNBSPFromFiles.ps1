param (
    [Parameter(Mandatory,Position=0)]
    [String]$FileList
)

$Files = Get-Content $FileList

$error.clear()
try {
    $Files | Remove-NBSPFromFile
    Remove-Item $FileList -Force
} catch {
    throw
}
if (!$error) {
    $ToastM1	= 'Operation Complete'
    $ToastM2	= 'All NBSP characters have been removed.'
    $ToastImage = "$PSScriptRoot\images\Toast\toast-powershell.png"

    $Builder =  New-BTContentBuilder
    $Builder |  Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
                Add-BTText -Text $ToastM1 -PassThru |
                Add-BTText -Text $ToastM2

    $Builder |  Show-BTNotification
}


