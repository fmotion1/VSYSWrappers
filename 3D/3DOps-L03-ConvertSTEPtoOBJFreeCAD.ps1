param(
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

foreach ($File in $Files) {

    $NewFile = [System.IO.Path]::ChangeExtension($File,'obj')

    Write-Host "Processing $File..."

    try{
        $PYCmd = Get-Command py.exe
    }
    catch {
        throw "Py launcher (py.exe) can't be located. Make sure Python 3.8 and the Python Launcher is installed and available in PATH."    
    }

    $ConversionScript = Join-Path $PSScriptRoot "3DOps-L03-ConvertSTEPtoOBJFreeCAD.py"
    $PYParams = '-3.8', $ConversionScript, $File, $NewFile
    & $PYCmd $PYParams | Out-Null

    Write-Host "Complete."
}

Remove-Item $FileList -Force


