param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $File,

    [Parameter(Mandatory = $false, Position = 1)]
    [String]
    $Destination
)

if(!$Destination){
    $Destination = [System.IO.Path]::GetDirectoryName($File)
}

Get-SVGsFromFile -Source $File -Destination $Destination

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All SVGs have been successfully extracted.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification