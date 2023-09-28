param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Folders = Get-Content $FileList

Set-Location -LiteralPath ([IO.Path]::GetTempPath())


foreach ($Folder in $Folders) {
    attrib -s -h -r `"$Folder`"
    $Folder = "$Folder\*.*"
    attrib -s -h -r `"$Folder`" /S /D
}

Remove-Item $FileList -Force

Request-ExplorerRefresh

Invoke-VBMessageBox "Operation Complete" -Title "Operation Complete" -Icon Information -BoxType OKOnly