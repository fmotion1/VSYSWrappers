param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $RemoveComments
)

$Files = Get-Content $FileList

$invokeOokiiInputDialogSplat = @{
    MainInstruction = "Specify Stroke Color"
    MainContent = "Please input a HEX formatted color code for the stroke color."
    WindowTitle = "Input Color"
    InputText = "#000000"
    MaxLength = 7
}

$DialogResponse = Invoke-OokiiInputDialog @invokeOokiiInputDialogSplat
$ReplacementStrokeColor = $DialogResponse[0]
while ($ReplacementStrokeColor -inotmatch '#[0-9a-f]{3,6}') {
    $DialogResponse = Invoke-OokiiInputDialog @invokeOokiiInputDialogSplat
    $ReplacementStrokeColor = $DialogResponse[0]
}
if(!$ReplacementStrokeColor){
    return
}

foreach ($File in $Files) {

    $SVGContent   = Get-Content -Path $File -Raw
    if($RemoveComments){
        $SVGContent = $SVGContent -replace '(<!--[\s\S\n]*?-->)',''
    }
    $SVGContent = $SVGContent.Trim()

    if(!($SVGContent -inotmatch ' stroke="#[0-9a-f]{3,6}"')){
        $SVGContent = $SVGContent -ireplace ' stroke="#[0-9a-f]{3,6}"'," stroke=`"$ReplacementStrokeColor`""
        [System.IO.File]::WriteAllText($File, $SVGContent)
    }
}

Remove-Item $FileList -Force