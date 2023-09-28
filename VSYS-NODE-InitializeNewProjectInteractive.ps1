param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $Folder
)

Add-Type -LiteralPath "$PSScriptRoot\lib\Spectre.Console.dll"

Set-Location -LiteralPath $Folder

$i = Get-ChildItem -Path $Folder
if ($i.Count -ne 0) {
    $MBoxSplat = @{
        Message = "The target directory is not empty. Please try again inside an empty directory."
        Title   = "Directory not Empty"
        Icon    = "Critical"
        BoxType = "OKOnly"
    }
    Invoke-VBMessageBox @MBoxSplat
    exit
}

## Retrieve all versions of Node:
# 'nvm root' stores all installations, so all we have to
# do is enumerate that directory and remove the
# "Current Root: " prefix that's emitted.

$R = & nvm root
[String]$NVMRoot = $R[1]
$NVMRoot = $NVMRoot.Replace('Current Root: ', '')
$Versions = Get-ChildItem -LiteralPath $NVMRoot -Directory | ForEach-Object { Split-Path $_ -Leaf }
$NodeVersions = $Versions.Split(" ")



$invokeSpectreConsoleSelectionSplat = @{
    Choices     = $NodeVersions
    PromptTitle = "Select the version of NodeJS that you want to deploy."
    PageSize    = 10
}

$VersionResult = Invoke-SpectreConsoleSelection @invokeSpectreConsoleSelectionSplat

Write-Host "`n"

$sNotify = [Spectre.Console.Markup]::new("You selected [bold white]$VersionResult[/].")
[Spectre.Console.AnsiConsole]::Write($sNotify)

Write-Host "`n"

$VersionResult = $VersionResult.TrimStart('v')

nvm use $VersionResult

$cmd = Get-Command npm
& $cmd init -y

$DevModulesToInstall = @(
    'typescript',
    'ts-node',
    'tsx',
    'webpack'
)

$InvokeSpectreConsoleMultiselectionSplat = @{
    Choices     = $DevModulesToInstall
    PromptTitle = 'Select any optional development modules to install in your environment:'
    AllowNoSelection = $true
}

$DevToInstall = Invoke-SpectreConsoleMultiselection @InvokeSpectreConsoleMultiselectionSplat

foreach ($Item in $DevToInstall) {
    & $cmd i -d $Item
}

$msg = "Would you like to initialize a git repository? [Y/N]"
$gitResponse = Read-Host -Prompt $msg
if($gitResponse -eq 'y'){
    $GitignoreSource = "D:\Dev\00 Templates\Gitignore\VSYS.gitignore"
    [IO.File]::Copy($GitignoreSource, (Join-Path $Folder '.gitignore'), $true)
    & git init
}

Write-Host "Your environment has been set up now.`n" -ForegroundColor White
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');