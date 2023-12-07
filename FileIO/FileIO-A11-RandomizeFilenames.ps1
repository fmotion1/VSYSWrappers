param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

# $Files | Rename-RandomizeFilenames
Rename-RandomizeFilenames -Files $Files

Request-ExplorerRefresh
Remove-Item $FileList -Force