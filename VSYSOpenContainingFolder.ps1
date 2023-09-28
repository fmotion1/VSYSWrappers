param (
    [Parameter(Mandatory,Position=0)]
    [String]$File
)

$DirectoryToOpen = Get-FilePathComponent -Path $File -Component Folder
& explorer $DirectoryToOpen