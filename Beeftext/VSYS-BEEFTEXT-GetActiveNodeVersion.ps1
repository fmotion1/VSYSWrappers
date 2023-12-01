$Versions = Get-InstalledNodeVersionsWithNVM -VersionAndPath -HideTable
foreach ($V in $Versions) {
    $V.Version
}