param (
    [Parameter(Mandatory=$false,Position=0,ValueFromPipeline)]
    $ImageFile="C:\Wallpapers\TestImages\TestImg 03.jpg",

    [Parameter(Mandatory=$false)]
    [ValidateSet(3,4,5,6,7,8,9,10)]
    [int]
    $NumColors=6,

    [Parameter(Mandatory=$false)]
    [String]
    $Resize=40,

    [Parameter(Mandatory=$false)]
    [ValidateSet('RGB','HEX', IgnoreCase = $true)]
    [String]
    $OutputFormat = 'hex'

)

$OutputFormat = $OutputFormat.ToLower()

# Using -Raw, read the file in full, as a single, multi-line string.
$DcolorsScript = Get-Content -Raw ./shellscripts/dcolors.sh

# !! The \-escaping is needed up to PowerShell 7.2.x
wsl bash -c ($DcolorsScript -replace '"', '\"')


