﻿param (
    [Parameter(Mandatory)]
    [Alias("f")]
    [String]
    $FileList
)

function New-VariableFolder {
    param (
        [Parameter(Mandatory=$true)]
        [String[]]$Files
    )

    foreach ($File in $Files) {

        $NewFolderName = "$File VF"
        if (-not (Test-Path $NewFolderName)) {
            [System.IO.Directory]::CreateDirectory($NewFolderName) | Out-Null
        }
    }
}


$Files = Get-Content $FileList

try {
    New-VariableFolder -Files $Files
} catch {
    Remove-Item $FileList -Force
    $PSCmdlet.ThrowTerminatingError($PSItem)
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-folder-tree-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification
