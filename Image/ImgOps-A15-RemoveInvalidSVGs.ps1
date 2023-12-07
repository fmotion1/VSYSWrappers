param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

$Files = Get-Content $FileList

$Files | ForEach-Object -Parallel {

    $CurrentFile = $_
    $CurrentFileExtension = [IO.Path]::GetExtension($CurrentFile)
    if($CurrentFileExtension -ne '.svg'){
        return
    }

    $FileContents = Get-Content $CurrentFile -Raw

    if ($FileContents -notmatch "<svg") {
        Remove-Item $CurrentFile -Force
        Write-Host "Deleted invalid SVG: $CurrentFile"
    }

} -ThrottleLimit $MaxThreads

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All invalid SVG files have been deleted.'
$ToastImage = "$PSScriptRoot\images\Toast\toast-trash.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification