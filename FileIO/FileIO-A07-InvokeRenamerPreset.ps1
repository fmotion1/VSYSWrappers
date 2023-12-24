param (
    [Parameter(Mandatory,ValueFromPipeline)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [String]
    $PresetName,

    [Parameter(Mandatory=$false)]
    [Switch]
    $UI
)

if($UI) { $Mode = "/preset" } else { $Mode = "/rename" }
$Params = $Mode, $PresetName, "/list", $FileList

try {
    $CMD = Get-Command "C:\Program Files (x86)\ReNamer\ReNamer.exe"
    & $CMD $Params | Out-Null
} catch {
    throw
}

Remove-Item $FileList -Force

if(!$UI){
    $ToastM1	= 'Operation Complete'
    $ToastM2	= 'All files have been renamed.'
    $ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-rename-1.png"

    $Builder =  New-BTContentBuilder
    $Builder |  Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
                Add-BTText -Text $ToastM1 -PassThru |
                Add-BTText -Text $ToastM2

    $Builder |  Show-BTNotification
}
