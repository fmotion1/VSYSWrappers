function Uninstall-GlobalPackages {
    param(
        [Parameter(Mandatory)]
        [String]
        $Version,

        [Parameter(Mandatory,ValueFromRemainingArguments)]
        [String[]]
        $Packages
    )

    & nvm use $Version
    $cmd = Get-Command npm.cmd
    & $cmd uninstall -g $Packages.Trim()
}

$MultiplePackages = $false

$NPMString = Invoke-SpectreTextPrompt -Prompt "Please type the name of the package(s) you want to gloablly uninstall:" -ClearScreenBeforeDisplay
$Packages = $NPMString.Split(" ")
if($Packages.Count -gt 1){
    $MultiplePackages = $true
}

foreach ($Package in $Packages) {

    $NPMURL = "https://registry.npmjs.org/" + $Package

    try {
        $APIResults = Invoke-RestMethod $NPMURL
    } catch {
        $StatusCode = $_.Exception.Response.StatusCode.value__
    }
    # Write-Host "`$APIResults:" $APIResults -ForegroundColor Green
    if($StatusCode -eq '404'){
        Read-Host "Package $NPMString does not exist on npm.js. Press any key to exit."
        exit
    }
}

$PCount = $Packages.Count
$PStr = $Packages -join ", "

if($MultiplePackages){

    $Prompt = "Are you sure you want to uninstall $PCount packages ([white]$PStr[/]) globally for all Node versions?"
    $Success = "`nUninstalling the packages ([white]$PStr[/]) now.`n"
    $Instruction = "[grey66][WHITE]$PStr[/] will be uninstalled in the following node versions:`n`n[/]"

} else {

    $Prompt = "Are you sure you want to uninstall package ([white]$PStr[/]) globally for all Node versions?"
    $Success = "`nnUninstalling package ([white]$PStr[/]) now.`n"
    $Instruction = "[grey66][WHITE]$PStr[/] will be uninstalled in the following node versions:`n`n[/]"
}

$NodeVersions = Get-NVMAllNodeVersions

foreach ($NodeVersion in $NodeVersions) {
    $Instruction = $Instruction + '> ' + $NodeVersion + "`n"
}

$Result = Invoke-SpectreTextPromptConfirm -Prompt $Prompt -ConfirmSuccess $Success -PreInstruction $Instruction
if($Result -ne "Y"){
    exit
}

foreach ($NodeVersion in $NodeVersions) {
    Uninstall-GlobalPackages -Version $NodeVersion -Packages $Packages
}

