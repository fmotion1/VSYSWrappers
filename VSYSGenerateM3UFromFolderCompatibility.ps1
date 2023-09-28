param (
    [Parameter(Mandatory)]
    [String]
    $Directory,

    [Parameter(Mandatory=$false)]
    [String]
    $M3UFilename
)

$M3UDirectory = [System.IO.DirectoryInfo]$Directory
Write-Host "`$M3UDirectory:" $M3UDirectory -ForegroundColor Green

$MediaFiles = [System.Collections.ArrayList]@()
$Files = $M3UDirectory.GetFiles()
$Files | ForEach-Object {
    if($_ -match '\.(mp3|flac|wma|aiff|aif|wav|m4a|mp4|aac|ogg|alac)$'){
        $MediaFiles.Add($_.Name)
    }
}

$MediaFiles.Sort()

if($M3UFilename -eq ""){
    $M3UFilename = "00 " + $M3UDirectory.BaseName + ".m3u"
}elseif ( ! $M3UFilename.EndsWith("m3u") ) {
    $M3UFilename = "$M3UFilename.m3u"
}

$M3UFullname = Join-Path -Path $M3UDirectory -ChildPath $M3UFilename
if ( Test-Path $M3UFullname -PathType Leaf ) { Remove-Item $M3UFullname }

$MediaFilesStr = $MediaFiles -join [Environment]::NewLine
$MediaFilesStr | Out-File -Encoding UTF8 -FilePath $M3UFullname -NoNewline