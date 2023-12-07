param (
    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [ValidateSet('all','256px','128px','96px','64px','48px','32px','24px','20px','16px', IgnoreCase = $true)]
    [String[]]
    $SizesToConvert='all'
)

Add-Type -AssemblyName System.Drawing

$Files = Get-Content $FileList

$Files | ForEach-Object {

    $TempDir     = New-TempDirectory
    $TempDirName = $TempDir.FullName
    $icoFile     = $_.Replace('`[', '[')
    $icoFile     = $icoFile.Replace('`]', ']')


    magick $icoFile -set filename:f "%t_%wpx" $TempDirName\%[filename:f].png

    $GeneratedPNGs = Get-ChildItem $TempDirName -File | ForEach-Object { $_.FullName }
    $PNGMatches = @()

    if($SizesToConvert -contains "all"){
        $PNGMatches = $GeneratedPNGs
    }else{
        foreach ($PNGName in $GeneratedPNGs) {
            foreach ($Size in $SizesToConvert) {
                if ($PNGName.Contains($Size)) {
                    $PNGMatches += $PNGName
                }
            }
        }
    }

    $DestDir = Split-Path $icoFile -Parent
    $DestDir = Join-Path $DestDir "PNG Conversion"

    if(!(Test-Path -LiteralPath $DestDir -PathType Container)){
        [IO.Directory]::CreateDirectory($DestDir) | Out-Null
    }

    if ($PNGMatches.Count -gt 0) {
        $PNGMatches | ForEach-Object {
            $fn = [IO.Path]::GetFileName($_)
            $DestFile = Join-Path $DestDir $fn
            $IDX = 2
            $PadIndexTo = '1'
            $StaticFilename = [IO.Path]::Combine((Split-Path $DestFile -Parent),(Split-Path $DestFile -LeafBase))
            $FileExtension  = [System.IO.Path]::GetExtension($DestFile)
            while (Test-Path -LiteralPath $DestFile -PathType Leaf) {
                $DestFile = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
                $IDX++
            }

            Write-Host "`$_:" $_ -ForegroundColor Green
            Write-Host "`$DestFile:" $DestFile -ForegroundColor Green

            [IO.File]::Move($_, $DestFile)

        }
    }else {

        Write-Host "No matches were found, therefore no results to save."

    }
}

Remove-Item $FileList -Force