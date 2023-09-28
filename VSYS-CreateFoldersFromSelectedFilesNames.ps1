param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

foreach ($File in $Files) {
    $Components = Get-FilePathComponents -Path $File
    $FileFolder = $Components.ContainingFolder
    $FolderName = $Components.FileBaseName

    try {
        New-Item -Path $FileFolder -Name $FolderName -ItemType Directory -Force
    } catch {
        throw
    }
}


Remove-Item $FileList -Force

