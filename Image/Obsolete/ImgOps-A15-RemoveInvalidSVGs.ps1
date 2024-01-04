param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

$Files = Get-Content $FileList -Filter '*.svg'
if(!$Files){
    Write-Error "No files have been passed."
    throw
}

try {
    $Files | ForEach-Object -Parallel {

        $CurrentFile = $_
        $FileContents = Get-Content $CurrentFile -Raw
    
        if ($FileContents -notmatch "<svg") {
            Remove-Item $CurrentFile -Force
            Write-Verbose "Deleted invalid SVG: $CurrentFile"
        }
    
    } -ThrottleLimit $MaxThreads
}
catch {
    Write-Error "An error occured during processing."
    Remove-Item $FileList -Force
    throw $_
}

Remove-Item $FileList -Force

$ToastM1	= 'Operation Complete'
$ToastM2	= 'All invalid SVG files have been deleted.'
$ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-trash.png"
$Builder = New-BTContentBuilder
$Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
           Add-BTText -Text $ToastM1 -PassThru |
           Add-BTText -Text $ToastM2
$Builder | Show-BTNotification