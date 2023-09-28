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

    $Image = $_


    $ImagePath = [System.IO.Path]::GetDirectoryName($Image) + [System.IO.Path]::DirectorySeparatorChar
    $ImageBase = [System.IO.Path]::GetFileNameWithoutExtension($Image)
    $ImageExt  = [System.IO.Path]::GetExtension($Image).TrimStart('.')

    $ImageDestName = "{0}{1}_{2}.{3}" -f $ImagePath, $ImageBase, "Flattened", $ImageExt

    $IDX = 2
    $PadIndexTo = '1'
    $StaticFilename = [IO.Path]::Combine((Split-Path $ImageDestName -Parent), (Split-Path $ImageDestName -LeafBase))
    $FileExtension  = [System.IO.Path]::GetExtension($ImageDestName)
    while (Test-Path -LiteralPath $ImageDestName -PathType Leaf) {
        $ImageDestName = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
        $IDX++
    }

    $Script = $Image, '-background', 'white', '-flatten', '-alpha', 'off', $ImageDestName
    & magick @Script

} -ThrottleLimit $MaxThreads


Remove-Item $FileList -Force