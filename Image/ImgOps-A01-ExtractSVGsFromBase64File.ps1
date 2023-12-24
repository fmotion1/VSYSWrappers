param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $File,

    [Parameter(Mandatory = $false, Position = 1)]
    [String]
    $Destination,

    [Parameter(Mandatory=$false)]
    [Switch]
    $DisableSVGCleaning
)

if(!$Destination){
    $InputFileDirectoryName = [System.IO.Path]::GetDirectoryName($File)
    $InputFilenameBase = [IO.Path]::GetFileNameWithoutExtension($File) + " SVG Extract"
    $Destination = Join-Path $InputFileDirectoryName "\$InputFilenameBase"
}

if($DisableSVGCleaning){
    Get-SVGsFromFileBase64 -Source $File -Destination $Destination -DisableSVGCleaning
}else{
    Get-SVGsFromFileBase64 -Source $File -Destination $Destination
}


$ToastM1	= 'Operation Complete'
$ToastM2	= 'All SVGs have been successfully extracted.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-photo-1.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification