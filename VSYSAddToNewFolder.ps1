param (
    [Parameter(Mandatory=$true,Position=0)]
    [String]$FileList
)

$ObjectsToMove = @(Get-Content $FileList -Encoding utf8)
$Destination = [System.IO.Path]::GetDirectoryName($ObjectsToMove[0]) + "\" + "New Folder"

$IDX = 2
$PadIndexTo = '1'
$StaticFilename = $Destination

while (Test-Path -LiteralPath $Destination -PathType Container) {
    $Destination = "{0} {1:d$PadIndexTo}" -f $StaticFilename, $IDX
    $IDX++
}

[IO.Directory]::CreateDirectory($Destination)

foreach ($File in $ObjectsToMove) {
    if(Test-Path -LiteralPath $File -PathType Leaf){
        $Fin = [IO.Path]::Combine($Destination, ([System.IO.Path]::GetFileName($File)))
        [System.IO.File]::Move($File,$Fin)
    }else{
        $Fin = Join-Path -Path $Destination -ChildPath (Split-Path -Path $File -Leaf)
        Move-Item -Path $File -Destination $Fin
    }
}

Remove-Item $FileList -Force

$wshell = New-Object -ComObject wscript.shell;
$wshell.SendKeys("{F5}")

