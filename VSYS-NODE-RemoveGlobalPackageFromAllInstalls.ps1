Clear-Host

$NPMString = Invoke-SpectreTextPrompt -Prompt "Please type the name of the package(s) you want to uninstall gloablly:"
$Packages = ($NPMString.Trim()).Split(" ")
$NumPackages = $Packages.Count

$Multiple = ($NumPackages -gt 1) ? $true : $false

foreach ($Package in $Packages) {
    if(-not(Confirm-NPMPackageExists $Package)){
        Write-Error "The package $Package does not exist in the NPMjs registry. Aborting."
        return
    }
}

$PackageList = $Packages -join ", "

if($Multiple){
    $Instruction = "[grey66]The packages [WHITE]$PackageList[/] will be uninstalled in the following node versions:`n`n[/]"
    $Prompt = "Are you sure you want to uninstall the $NumPackages packages [white]$PackageList[/] globally from all Node versions?"
    $Success = "`nUninstalling the packages [white]$PackageList[/] now.`n"
    
} else {
    $Instruction = "[grey66]The package [WHITE]$PackageList[/] will be uninstalled in the following node versions:`n`n[/]"
    $Prompt = "Are you sure you want to uninstall the package [white]$PackageList[/] globally from all Node versions?"
    $Success = "`nUninstalling package [white]$PackageList[/] now.`n"
}

$NodeVersions = Get-InstalledNodeVersionsWithNVM -VersionOnly -InsertLeadingV -Branch CURRENT
foreach ($Version in $NodeVersions) {
    $Instruction = $Instruction + '> ' + $Version + "`n"
}

Write-SpectreHost $Instruction
$Result = Invoke-SpectreTextPromptConfirm -Prompt $Prompt -ConfirmSuccess $Success
if($Result -ne "Y"){
    exit
}

foreach ($NodeVersion in $NodeVersions) {
    Uninstall-NodeGlobalPackages -Version $NodeVersion -Packages $Packages
}



