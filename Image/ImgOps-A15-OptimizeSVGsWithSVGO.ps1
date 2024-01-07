param (
    [Parameter(Mandatory)]
    [String] $FileList,
    [Int32] $MaxThreads = 16
)

$Files = Get-Content $FileList

try {
    Optimize-SVGWithSVGO -Files $Files -ErrorAction Stop
}
catch {
    Remove-Item $FileList -Force
    Write-Error "An error occured."
    throw $_
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All SVGs have successfully been optimized.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
            Add-BTText -Text $ToastM1 -PassThru |
            Add-BTText -Text $ToastM2
$Builder | Show-BTNotification

