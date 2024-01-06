param (
    [Parameter(Mandatory)]
    [String] $FileList,
    [Parameter(Mandatory)]
    [String] $PresetName,
    [Switch] $UI,
    [Int32] $ThrottleLimit = 12
)

$Folders = Get-Content $FileList
$RenameMode = "/rename"
if($UI) { $RenameMode = "/preset" }

try {
    $CmdRenamer = Get-Command 'C:\Program Files (x86)\ReNamer\ReNamer.exe' -ErrorAction Stop
} catch {
    Remove-Item $FileList -Force
    Write-Error "Can't find Renamer."
    throw $_
}

$Folders | ForEach-Object -Parallel {
    $Folder = $_
    $Params = $Using:RenameMode, $Using:PresetName, $Folder
    $Cmd = $Using:CmdRenamer
    & $Cmd $Params | Out-Null

} -ThrottleLimit $ThrottleLimit


Remove-Item $FileList -Force

if(!$UI){
    $ToastM1	= 'Operation Complete'
    $ToastM2	= 'All files have successfully been processed.'
    $ToastImage = "D:\Dev\Powershell\VSYSWrappers\00 Toast\toast-folder-tree-1.png"
    $Builder = New-BTContentBuilder
    $Builder | Add-BTAppLogo -Source $ToastImage -Crop Circle -PassThru |
            Add-BTText -Text $ToastM1 -PassThru |
            Add-BTText -Text $ToastM2
    $Builder | Show-BTNotification
}
