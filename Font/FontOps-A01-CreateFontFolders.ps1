param (
    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $Versioned,

    [Parameter(Mandatory=$false)]
    [Switch]
    $WFR
)

$Files = Get-Content $FileList

try {
    Write-Host "`$Versioned:" $Versioned -ForegroundColor Green
    Save-FontsToVersionedFolder -Files $Files -WFR:$WFR -Versioned:$Versioned -MaxThreads 8

} catch {
    Remove-Item $FileList -Force
    throw
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All fonts have been separated.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-font-general.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification