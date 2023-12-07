param (

    [Parameter(Mandatory)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [String]
    $ColorToRemove,

    [Parameter(Mandatory=$false)]
    [Switch]
    $CustomColor,

    [Parameter(Mandatory=$false)]
    [Switch]
    $Trim,

    [Parameter(Mandatory=$false)]
    [String]
    $Fuzz = "10%",

    [Parameter(Mandatory=$false,ValueFromPipelineByPropertyName)]
    [Int32]
    $MaxThreads = 16
)


if(!$CustomColor){
    $ColorToRemove = '#' + $ColorToRemove
    if (!($ColorToRemove -match '^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$')) {
        throw [System.ArgumentException] "The replacement color is not in a valid format."
    }
}else{
    $invokeOokiiInputDialogSplat = @{
        MainInstruction = "Specify Color To Remove"
        MainContent = "Please input a HEX formatted color code for the color to remove."
        WindowTitle = "Input Color"
        InputText = "#000000"
        MaxLength = 7
    }

    $DialogResponse = Invoke-OokiiInputDialog @invokeOokiiInputDialogSplat
    $ReplacementHex = $DialogResponse[0]
    while ($ReplacementHex -inotmatch '^#([0-9a-f]{3}|[0-9a-f]{6})$') {
        $DialogResponse = Invoke-OokiiInputDialog @invokeOokiiInputDialogSplat
        $ReplacementHex = $DialogResponse[0]
    }
    if(!$ReplacementHex){
        return
    }

    $ColorToRemove = $ReplacementHex
}



$List = Get-Content $FileList

$List | ForEach-Object -Parallel {

    $Image = $_.Replace('`[', '[')
    $Image = $Image.Replace('`]', ']')

    $Color   = $Using:ColorToRemove
    $FuzzVal = $Using:Fuzz
    $DoTrim  = $Using:Trim

    $ImageFolder = Get-FilePathComponent -Path $Image -Component Folder
    $ImageDestFolder = Join-Path $ImageFolder "Color Removal"

    if(!(Test-Path -Path $ImageDestFolder -PathType Container)){
        New-Item -Path $ImageDestFolder -ItemType Directory -Force | Out-Null
    }

    $ImageNewName = [IO.Path]::GetFileNameWithoutExtension($Image) + ".png"
    $ImageDestPath = Join-Path $ImageDestFolder $ImageNewName

    $DestFile = $ImageDestPath
    $IDX = 2
    $PadIndexTo = '1'
    $StaticFilename = Get-FilePathComponent $DestFile -Component FullPathNoExtension
    $FileExtension  = Get-FilePathComponent $DestFile -Component FileExtension
    while (Test-Path -LiteralPath $DestFile -PathType Leaf) {
        $DestFile = "{0}_{1:d$PadIndexTo}{2}" -f $StaticFilename, $IDX, $FileExtension
        $IDX++
    }

    if($DoTrim){
        magick $Image -fuzz $FuzzVal -transparent $Color -gravity center -trim png32:$DestFile
    }else{
        magick $Image -fuzz $FuzzVal -transparent $Color png32:$DestFile
    }

} -ThrottleLimit $MaxThreads