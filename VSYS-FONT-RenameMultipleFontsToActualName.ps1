param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList


Rename-FontsToActualName -Files $Files

Start-Sleep -Milliseconds 10
$wshell = New-Object -ComObject wscript.shell;
$wshell.SendKeys("{F5}")
Start-Sleep -Milliseconds 30
$wshell.SendKeys("{F5}")
# Request-ExplorerRefresh

Remove-Item $FileList -Force

$ToastM1	= 'Font Rename Complete.'
$ToastM2	= 'All files have been successfully renamed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-font-general.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification