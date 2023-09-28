[CmdletBinding(DefaultParameterSetName='Percentage')]
param (

    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('png','jpg','jpeg','gif','tif','bmp','webp',IgnoreCase=$true)]
    [String]
    $DestFormat,

    [Parameter(Mandatory,ParameterSetName='Width')]
    [int]
    $Width,

    [Parameter(Mandatory,ParameterSetName='Height')]
    [int]
    $Height,

    [Parameter(Mandatory,ParameterSetName='Percentage')]
    [int]
    $Percentage

)

$Files = Get-Content $FileList

try {
    switch ($PSCmdlet.ParameterSetName) {
        "Percentage"    { Convert-ResizeRasterImage -Files $Files -DestFormat $DestFormat -DestPercentage $Percentage; break }
        "Width"         { Convert-ResizeRasterImage -Files $Files -DestFormat $DestFormat -DestWidth $Width; break }
        "Height"	    { Convert-ResizeRasterImage -Files $Files -DestFormat $DestFormat -DestHeight $Height; break }
    }
} catch {
    Remove-Item $FileList -Force
    throw
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All files have successfully been processed.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification
