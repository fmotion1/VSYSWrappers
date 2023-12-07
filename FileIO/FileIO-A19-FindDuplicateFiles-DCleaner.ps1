<#

.DESCRIPTION
    A wrapper function for Duplicate Cleaner Pro.
    Supports multi-folder selection via use of
    SingleInstanceAccumulator.exe. 
    
    RunHiddenConsole.exe is also used to supress 
    any Powershell windows from flickering on execution.

    Just select the directories you want to compare
    and invoke the script via context-menu.

    Full registry command:
    "C:\Tools\scripts\BIN\SingleInstanceAccumulator.exe" -q:' "-c:C:\Tools\scripts\BIN\RunHiddenConsole.exe pwsh -noprofile -windowstyle hidden -Command "C:\Tools\scripts\VSYSFindDuplicateFiles.ps1" -Directories $files" "%1"
.LINK
    https://github.com/visusys
    
#>
param (
    [Parameter(Mandatory, Position=0)]
    [String[]]
    $FileList
)

$Files = Get-Content $FileList

$ArgStr = ""
foreach ($Dir in $Files) {
    if(Test-Path -LiteralPath $Dir -PathType Container){
        $ArgStr = $ArgStr + ("/i `"$Dir`" ")
    }
}

$Process = "C:\Program Files (x86)\Duplicate Cleaner 5\Duplicate Cleaner 5.exe"
Start-Process -FilePath $Process -ArgumentList $ArgStr" /a"

Remove-Item $FileList -Force
