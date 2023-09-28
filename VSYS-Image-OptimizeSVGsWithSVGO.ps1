
param (
    [Parameter(Mandatory)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

try{
    Optimize-SVGWithSVGO -Files $Files
}
catch {
    Remove-Item $FileList -Force
    throw
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All SVGs have successfully been optimized.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
            Add-BTText -Text $ToastM1 -PassThru |
            Add-BTText -Text $ToastM2
$Builder | Show-BTNotification

