param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [String]
    $M3UFilename
)

$M3UDirectory = ''
$MediaFiles = [System.Collections.ArrayList]@()
Get-Content $FileList | ForEach-Object {
    if($_ -match '\.(mp3|flac|wma|aiff|aif|wav|m4a|mp4|aac|ogg|alac)$'){
        if($M3UDirectory -eq ''){
            $M3UDirectory = [System.IO.FileInfo]([IO.Path]::GetDirectoryName($_))
        }
        $MediaFiles.Add([IO.Path]::GetFileName($_))
    }
}

$MediaFiles.Sort()

if($M3UFilename -eq ""){
    $Dir = $M3UDirectory.FullName
    $Dir = [System.IO.FileInfo]($Dir -replace "\.","")
    $M3UFilename = "00 " + $Dir.BaseName + ".m3u"
}elseif ( ! $M3UFilename.EndsWith("m3u") ) {
    $M3UFilename = "$M3UFilename.m3u"
}

$M3UFullname = Join-Path -Path $M3UDirectory -ChildPath $M3UFilename
if ( Test-Path $M3UFullname -PathType Leaf ) { Remove-Item $M3UFullname }

$MediaFilesStr = $MediaFiles -join [Environment]::NewLine
$MediaFilesStr | Out-File -Encoding UTF8 -FilePath $M3UFullname -NoNewline

Remove-Item $FileList -Force