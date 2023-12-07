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
$NodeVersions = Get-InstalledNodeVersionsWithNVM -VersionOnly -Branch CURRENT
$readSpectreMultiSelectionSplat = @{
    Title = "Select versions of Node.js you wish to install to."
    Choices = $NodeVersions
    Color = "Green"
    PageSize = 6
}
$SelectedVersions = Read-SpectreMultiSelection @readSpectreMultiSelectionSplat

$SelectedVersionsAddon = @()
for ($idx = 0; $idx -lt $SelectedVersions.Count; $idx++) {
    $SelectedVersionsAddon += ('> ' + 'v' + $($SelectedVersions[$idx])).TrimStart()
    $SelectedVersionsAddonBare += ($($SelectedVersions[$idx])).TrimStart()
}

if($Multiple -eq $true){
    $InstructionPlural = "[grey66]The packages [WHITE]$PackageList[/] will be installed in the following node versions:`n[/]"
    foreach ($SelectedVersion in $SelectedVersionsAddon) {
        $InstructionPlural = $InstructionPlural + "`n" + "[#7777F9]$SelectedVersion[/]"
    }

    Write-SpectreHost $("`n" + $InstructionPlural + "`n")
    $Prompt = "[grey66]Are you sure you want to install the $NumPackages packages ([white]$PackageList[/]) globally?`n[/]"
    $Success = "[grey66]`nInstalling the packages [white]$PackageList[/] now.`n[/]"
} else {
    $InstructionSingle = "[grey66]The package [WHITE]$PackageList[/] will be installed in the following node versions:`n[/]"
    foreach ($SelectedVersion in $SelectedVersionsAddon) {
        $InstructionSingle = $InstructionSingle + "`n" + "[#7777F9]$SelectedVersion[/]"
    }
    Write-SpectreHost $("`n" + $InstructionSingle + "`n")
    $Prompt = "[grey66]Are you sure you want to install the package ([white]$PackageList[/]) globally?`n`n[/]"
    $Success = "[grey66]`nInstalling package [white]$PackageList[/] now.`n[/]"
}

$Result = Read-SpectreConfirm -Prompt $Prompt -ConfirmSuccess $Success
if($Result -ne "Y"){
    exit
}

foreach ($Version in $SelectedVersions) {
    Install-NodeGlobalPackages -Version $Version -Packages $Packages
}



