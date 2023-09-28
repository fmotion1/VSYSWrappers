param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

& "$env:PYVENV\Audio\Scripts\Activate.ps1"

$Files | ForEach-Object -Parallel {

    $TempDir = New-TempDirectory
    $TempDirName = $TempDir.FullName

    Write-Host "Processing $_ ..."
    Start-Process -FilePath "$env:PYVENV\Audio\Scripts\basic-pitch.exe" -ArgumentList "`"$TempDirName`"", "`"$_`"" -WindowStyle hidden -Wait

    $ConvertedFileBase = Get-FilePathComponent -Path $_ -Component FileBase
    $ConvertedFileExt  = ".mid"

    $FinalFileName = $ConvertedFileBase + "_basic_pitch" + $ConvertedFileExt
    $TempFileFull = Join-Path $TempDirName $FinalFileName

    $DestFolder = Get-FilePathComponent -Path $_ -Component Folder
    $DestFilePath = Join-Path $DestFolder $FinalFileName

    $IDX = 2
    $PadIndex = "1"

    $StaticFilename = Get-FilePathComponent $DestFilePath -Component FullPathNoExtension

    while (Test-Path -LiteralPath $DestFilePath -PathType Leaf) {
        $DestFilePath = "{0}_{1:d$PadIndex}{2}" -f $StaticFilename, $IDX, $ConvertedFileExt
        $IDX++
    }

    if (Test-Path -LiteralPath $TempFileFull -PathType Leaf) {
        [IO.File]::Move($TempFileFull, $DestFilePath)
    }

    Remove-Item -LiteralPath $TempDirName -Force -Recurse

    Write-Host "Completed Processing $_."

} -ThrottleLimit 16

Remove-Item $FileList -Force