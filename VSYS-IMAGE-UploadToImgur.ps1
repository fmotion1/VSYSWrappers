[System.IO.Path]::DirectorySeparatorChar
[System.IO.Path]::InvalidPathChars
[System.IO.Path]::ChangeExtension()

[System.IO.Path]::EndsInDirectorySeparator()
[System.IO.Path]::Exists()

[System.IO.Path]::GetDirectoryName()
[System.IO.Path]::GetExtension()
[System.IO.Path]::GetFileName()
[System.IO.Path]::GetFileNameWithoutExtension()
[System.IO.Path]::GetFullPath()
[System.IO.Path]::GetInvalidFileNameChars()
[System.IO.Path]::GetInvalidPathChars()
[System.IO.Path]::GetPathRoot()
[System.IO.Path]::GetRandomFileName()
[System.IO.Path]::GetRelativePath()
[System.IO.Path]::GetTempFileName()
[System.IO.Path]::GetTempPath()
[System.IO.Path]::HasExtension()
[System.IO.Path]::IsPathFullyQualified()
[System.IO.Path]::IsPathRooted()


[System.IO.Path]::Combine()

# The general idea from the discussion is to slowly
# deprecate Combine in favor of Join
[System.IO.Path]::Join()


[System.IO.Path]::TrimEndingDirectorySeparator()

# Outputs the dominant color of the input file, but
# treats white as a color. This only works properly on
# images that have a transparent background.

$Result = & magick -background None $SVGFile -scale "1x1^!" -alpha off -depth 8 -define ftxt:format=\H\n ftxt:

& rsvg-convert -w 300 -h 300 -a -f png $InputSVG -o $OutputPNG | Out-Null



