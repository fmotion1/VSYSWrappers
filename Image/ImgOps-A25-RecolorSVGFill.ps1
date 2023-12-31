param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$Files = Get-Content $FileList

$invokeOokiiInputDialogSplat = @{
    MainInstruction = "Specify Fill Color"
    MainContent = "Please input a HEX formatted color code for the fill color."
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

foreach ($File in $Files) {


    Write-Host "`$File:" $File -ForegroundColor Green

    $SVGContent = Get-Content -Path $File -Raw
    $SVGHasFill = $false
    $SVGHasStroke = $false

    $RegEx1 = 'fill="[#a-zA-Z0-9]+"'
    if($SVGContent -imatch $RegEx1){

        Write-Host "Match 1" -ForegroundColor Magenta

        $SVGContent = $SVGContent -ireplace $RegEx1, "fill=`"$ReplacementHex`""
        $SVGHasFill = $true
    }

    $RegEx2 = 'fill:([\s]*)(?!none\s*;)([\(\)#a-zA-Z0-9-]*)([\s;\}"]+)'
    if($SVGContent -imatch $RegEx2){

        Write-Host "Match 2" -ForegroundColor Magenta

        $SVGContent = $SVGContent -ireplace $RegEx2, "fill:$ReplacementHex`$3"
        $SVGHasFill = $true
    }

    #$RegEx3 = 'stroke="([#a-zA-Z0-9-_]*)"'
    $RegEx3 = 'stroke="#[a-fA-F0-9]+"'
    if($SVGContent -imatch $RegEx3){

        Write-Host "Match 3" -ForegroundColor Magenta

        $SVGContent = $SVGContent -ireplace $RegEx3, "stroke=`"$ReplacementHex`""
        $SVGHasStroke = $true
    }

    $RegEx4 = 'stop-color="#[a-fA-F0-9]+"'
    if($SVGContent -imatch $RegEx4){

        Write-Host "Match 4" -ForegroundColor Magenta

        $SVGContent = $SVGContent -ireplace $RegEx4, "stop-color=`"$ReplacementHex`""
        $SVGHasFill = $true
    }

    $RegEx5 = 'fill:([\s]*)(rgb\([0-9,]+\))([\s;\}"]+)'
    if($SVGContent -imatch $RegEx5){

        Write-Host "Match 5" -ForegroundColor Magenta

        $SVGContent = $SVGContent -ireplace $RegEx5, "fill:$ReplacementHex`$3"
        $SVGHasFill = $true
    }

    #$RegEx6 = 'stroke:([\s]*)(?!none\s*;)([\(\)#a-zA-Z0-9-]*)([\s;\}"]+)'
    $RegEx6 = 'stroke:([\s]*)(?!none\s*)([\(\)#a-zA-Z0-9-]*)([\s;\}"]+)'
    if($SVGContent -imatch $RegEx6){

        Write-Host "Match 6" -ForegroundColor Magenta

        $SVGContent = $SVGContent -ireplace $RegEx6, "stroke:$ReplacementHex`$3"
        $SVGHasStroke = $true
    }

    $RegEx7 = 'stroke:([\s]*)(rgb\([0-9,]+\))([\s;\}"]+)'
    if($SVGContent -imatch $RegEx7){

        Write-Host "Match 7" -ForegroundColor Magenta

        $SVGContent = $SVGContent -ireplace $RegEx7, "stroke:$ReplacementHex`$3"
        $SVGHasStroke = $true
    }

    if((!$SVGHasFill) -and (!$SVGHasStroke)){
        if($SVGContent -imatch '<path'){
            $SVGContent = $SVGContent -ireplace '<path',"<path fill=`"$ReplacementHex`""
        }elseif ($SVGContent -imatch '<g') {
            $SVGContent = $SVGContent -ireplace '<g',"<g fill=`"$ReplacementHex`""
        }else {
            $SVGContent = $SVGContent -ireplace '<svg',"<svg fill=`"$ReplacementHex`""
        }
    }

    Write-Host "WriteAllText: ($File) ($SVGContent)"
    [System.IO.File]::WriteAllText($File, $SVGContent)

}

Remove-Item $FileList -Force