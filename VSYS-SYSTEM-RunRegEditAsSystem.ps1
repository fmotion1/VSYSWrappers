$CMD = Get-Command PsExec64.exe
$Params = '-s', '-i', 'regedit.exe'
gsudo { & $args[0] $args[1] } -args $CMD, $Params