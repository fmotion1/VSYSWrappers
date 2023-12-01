# Automatically passed in from Windows context menu
param (
    [Parameter(Mandatory)]
    [Alias("f")]
    [String]
    $FileList
)

# Determine what folders are eligable for compilation.
$Files = Get-Content $FileList
$Eligable = @()
foreach ($Item in $Files) {
    if(Test-Path -Path $Item -PathType Container){
        $Matched = Get-ChildItem -LiteralPath $Item -Recurse -Filter 'build_release.ps1' -ErrorAction SilentlyContinue
        $Eligable += $Matched.DirectoryName | Sort-Object -Unique
    }
}


Write-SpectreHost -Message "Found [white]$($Eligable.Count)[/] directories eligable for re-compilation:"
$data = @()
foreach ($D in $Eligable) {
    $FolderName = [System.IO.Directory]::GetParent($D).BaseName
    $data += [pscustomobject]@{Folder=$FolderName; Path=$D}
}
Format-SpectreTable -Data $data -Border Square -Color Grey37
Read-SpectrePause -Message "Press any key to continue with the re-compilation."


$ProgressSteps = $Eligable.Length
$IncrementPercent = [Math]::Ceiling(100 / $ProgressSteps)

Invoke-SpectreCommandWithProgress -ScriptBlock {
    param (
        $Context1
    )
    $task1 = $Context1.AddTask("Removing $ProgressSteps old build artifacts.")
    foreach ($Dir in $Eligable) {
        $F1 = Join-Path $Dir 'bin'
        $F2 = Join-Path $Dir 'obj'

        Invoke-SpectreScriptBlockQuietly -Level Quieter -Command {
            Remove-Item $F1 -Recurse -Force | Out-Null
            Remove-Item $F2 -Recurse -Force | Out-Null
        }
        $task1.Increment($IncrementPercent)
    }
}

# Actually do the compiling
Invoke-SpectreCommandWithProgress -ScriptBlock {
    param (
        $Context2
    )

    $task2 = $Context2.AddTask("Compiling $ProgressSteps C# assemblies.")

    foreach ($D in $Eligable) {
        Push-Location $D
        Invoke-SpectreScriptBlockQuietly -Level Quieter -Command {
            & .\build_release.ps1
        }
        $task2.Increment($IncrementPercent)
    }
}


$TopMost = [System.IO.Path]::GetDirectoryName($Eligable[0])

$readSpectreConfirmSplat = @{
    Prompt = "Would you like to move all compiled assemblies to the [white]top-most parent folder?[/]"
    ConfirmSuccess = "Assemblies will be moved to [blue]$TopMost[/]"
}
$Result = Read-SpectreConfirm @readSpectreConfirmSplat

if($Result -eq 'True'){
    Invoke-SpectreCommandWithStatus -ScriptBlock { 
        foreach ($Dir in $Eligable) {
            $SourceDir = [System.IO.Path]::Combine($Dir, "bin", "Release", "net6.0")
            $Binaries = Get-ChildItem -Path $SourceDir -File
            foreach ($File in $Binaries) {
                Copy-Item $File -Destination $TopMost -Force
            }
        }
        Write-SpectreHost -Message "All files have been sucessfully copied."
    } -Spinner dots -Title "Copying Files..." -Color Magenta2
}

Write-Host -NoNewLine 'Press any key to exit.'
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')



