param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)


$MediaDirectories = [System.Collections.ArrayList]@()
Get-Content $FileList | ForEach-Object {
    $MediaDirectories.Add($_) | Out-Null
}

$MediaDirectories | ForEach-Object {

    $MediaFiles = [System.Collections.ArrayList]@()
    $M3UDirectory = [System.IO.DirectoryInfo]$_
    $Files = $M3UDirectory.GetFiles()
    $Files | ForEach-Object {
        if($_ -match '\.(mp3|flac|wma|aiff|aif|wav|m4a|mp4|aac|ogg|alac)$'){
            $MediaFiles.Add($_.Name) | Out-Null
        }
    }

    $MediaFiles.Sort()

    $M3UFilename = "00 - " + $M3UDirectory.BaseName + ".m3u"

    $M3UFullname = Join-Path -Path $M3UDirectory -ChildPath $M3UFilename
    if ( Test-Path $M3UFullname -PathType Leaf ) { Remove-Item $M3UFullname }

    $MediaFilesStr = $MediaFiles -join [Environment]::NewLine
    $MediaFilesStr | Out-File -Encoding UTF8 -FilePath $M3UFullname -NoNewline

}

Remove-Item $FileList -Force