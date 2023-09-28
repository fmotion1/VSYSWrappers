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

    $File = $_
    $TargetFolder = Get-FilePathComponent -Path $File -Component Folder
    $TargetFolderString = "$TargetFolder\*"
    & "C:\Tools\NirSoft\ResourcesExtract\resourcesextract.exe" /source $TargetFolderString

} -ThrottleLimit $MaxThreads