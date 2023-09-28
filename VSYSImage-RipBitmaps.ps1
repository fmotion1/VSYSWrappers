param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

$Files = Get-Content $FileList

$Files | ForEach-Object -Parallel {

    $FileToRip         = $_.Replace('`[', '[')
    $FileToRip         = $FileToRip.Replace('`]', ']')
    $FileToRipFilename = Get-FilePathComponent -Path $FileToRip -Component File
    $TempDir           = New-TempDirectory
    $TempDirName       = $TempDir.FullName

    $FileInTemp = Join-Path $TempDirName $FileToRipFilename

    [IO.File]::Copy($FileToRip, $FileInTemp) | Out-Null

    $App = "C:\Tools\MPontello Bitmap Ripper\BitmapRip.exe"

    & $App $FileInTemp | Out-Null

    $folderPath = $TempDirName
    $exceptionFileName = $FileToRipFilename

    $files = Get-ChildItem -Path $folderPath -File | Where-Object { $_.Name -ne $exceptionFileName }
    $filesList = $files.FullName

    $FileToRipBase = Get-FilePathComponent -Path $FileToRip -Component FileBase
    $DestFolderName = "BitmapRipper $FileToRipBase"

    $FileToRipFolder = Get-FilePathComponent -Path $FileToRip -Component Folder

    $DestFolder = Join-Path $FileToRipFolder $DestFolderName
    if(!(Test-Path -LiteralPath $DestFolder -PathType Container)){
        New-Item -Path $DestFolder -ItemType Directory -Force | Out-Null
    }

    foreach ($file in $filesList) {
        Move-Item -LiteralPath $file -Destination $DestFolder -Force | Out-Null
    }

} -ThrottleLimit $MaxThreads