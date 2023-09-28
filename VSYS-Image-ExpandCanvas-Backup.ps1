param (
    # [Parameter(Mandatory=$false, Position = 0)]
    # [String]
    # $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

# $Files = Get-Content $FileList
# $Files = "D:\TestImages\512_solus.png", "D:\TestImages\512_suse.png", "D:\TestImages\512_tails.png"

# $OokiiSplat = @{
#     MainInstruction = "Specify the expanded canvas background color."
#     MainContent     = 'Valid input is HEX (#RRGGBB), "black", "white", "transparent", or "none"'
#     WindowTitle     = "Image Expand"
#     InputText       = '1'
# }

# while ($true) {
#     $Result = Invoke-OokiiInputDialog @OokiiSplat
#     if ($Result[1] -eq 'Cancel') {
#         exit 2
#     }
#     [System.String]$BG = $Result[0]
#     if ($BG -match '^#[A-Fa-f0-9]{6}$') {
#         break
#     }
#     if (($BG -eq 'black') -or ($BG -eq 'white')) {
#         break
#     }
#     if (($BG -eq 'transparent') -or ($BG -eq 'none')) {
#         break
#     }
# }

Write-Host "`$Files:" $Files -ForegroundColor Green
$Files | ForEach-Object -Parallel {

    $Image = $_

    # $ImagePath = [System.IO.Path]::GetDirectoryName($Image) + [System.IO.Path]::DirectorySeparatorChar
    # $ImageBase = [System.IO.Path]::GetFileNameWithoutExtension($Image)
    # $ImageExt  = [System.IO.Path]::GetExtension($Image).TrimStart('.')

    # $ImageDestName = "{0}{1}_{2}.{3}" -f $ImagePath, $ImageBase, "Expanded", $ImageExt

    # $IDX = 2
    # $PadIndexTo = '1'
    # $StaticFilename = [IO.Path]::Combine((Split-Path $ImageDestName -Parent), (Split-Path $ImageDestName -LeafBase))
    # $FileExtension  = [System.IO.Path]::GetExtension($ImageDestName)
    # while (Test-Path -LiteralPath $ImageDestName -PathType Leaf) {
    #     $ImageDestName = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
    #     $IDX++
    # }

    # $Background = $Using:BG

    # if($Background -eq "transparent"){ $Background = "none" }
        try {
            Write-Host "`$Image:" $Image -ForegroundColor Green
            $Dimensions = Get-ImageDimensions($Image)
            $Dimensions.Width
            $Dimensions.Height
        } catch {
            $Error[0].Exception
            throw
        }

    #Write-Host "`$Dimensions.Width:" $Dimensions.Width -ForegroundColor Green
    #Write-Host "`$Dimensions.Height:" $Dimensions.Height -ForegroundColor Green

    # if($ImageExt -eq 'png'){
    #     $Script = $Image, "-background", "$BG", "-gravity", "center", "-extent", "120%", "PNG32:$ImageDestName"
    # } else {
    #     $Script = $Image, "-background", "$BG", "-gravity", "center", "-extent", "120%", $ImageDestName
    # }

    # & magick @Script

} -ThrottleLimit $MaxThreads


# Remove-Item $FileList -Force