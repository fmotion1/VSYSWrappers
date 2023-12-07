param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

foreach ($File in $Files) {

    $FileFolder = [System.IO.Path]::GetDirectoryName($File)
    $FolderName = [System.IO.Path]::GetFileNameWithoutExtension($File)
    try {
        $newItemSplat = @{
            Path = $FileFolder
            Name = $FolderName
            ItemType = 'Directory'
            Force = $true
        }
        New-Item @newItemSplat | Out-Null
    } catch {
        throw $_
    }
}

Remove-Item $FileList -Force

