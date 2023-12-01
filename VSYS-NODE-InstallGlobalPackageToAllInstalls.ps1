Clear-Host

$NPMString = Invoke-SpectreTextPrompt -Prompt "Please type the name of the package(s) you want to install gloablly:"
$Packages = ($NPMString.Trim()).Split(" ")
$NumPackages = $Packages.Count

$Multiple = ($NumPackages -gt 1) ? $true : $false

foreach ($Package in $Packages) {
    if(-not(Confirm-NPMPackageExistsInRegistry $Package)){
        Write-Error "The package $Package does not exist in the NPMjs registry. Aborting."
        return
    }
}

$PackageList = $Packages -join ", "

if($Multiple){
    $Instruction = "[grey66]The packages [WHITE]$PackageList[/] will be installed in the following node versions:`n`n[/]"
    $Prompt = "Are you sure you want to install the $NumPackages packages [white]$PackageList[/] globally to all Node versions?"
    $Success = "`nInstalling the packages [white]$PackageList[/] now.`n"
    
} else {
    $Instruction = "[grey66]The package [WHITE]$PackageList[/] will be installed in the following node versions:`n`n[/]"
    $Prompt = "Are you sure you want to install the package [white]$PackageList[/] globally to all Node versions?"
    $Success = "`nInstalling package [white]$PackageList[/] now.`n"
}

$NodeVersions = Get-InstalledNodeVersionsWithNVM -VersionOnly -Branch CURRENT
foreach ($Version in $NodeVersions) {
    $Instruction = $Instruction + '> ' + "v$Version" + "`n"
}

Write-SpectreHost $Instruction
$Result = Read-SpectreConfirm -Prompt $Prompt -ConfirmSuccess $Success
if($Result -ne "Y"){
    exit
}

foreach ($NodeVersion in $NodeVersions) {
    Install-NodeGlobalPackages -Version $NodeVersion -Packages $Packages
}



