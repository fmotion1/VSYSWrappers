param (
    [Parameter(Mandatory, Position = 0)]
    [ValidateScript({
        if (!(Test-Path -LiteralPath $_)) {
            throw [System.ArgumentException] "File or Folder does not exist."
        }
        return $true
    })]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [String]
    $Resolution
)

$Files = Get-Content $FileList
if(!$Files){
    throw [System.Exception] "File list is empty."
}

if(!$Resolution){
    . (Join-Path $PSScriptRoot '3DOps-L05-ConvertOBJtoVox-Form.ps1')

    $timer = New-Object System.Windows.Forms.Timer -Property @{Interval = 100}
    $timer.start()
    $timer.add_Tick({
        $FilesNum = @($Files).Length
        $VSYSLBLBottomNumFiles.text=[System.String]"Number of files queued for conversion: $FilesNum"
        $timer.Stop()
    })

    $VSYSBTNConvert.Add_Click({ 
        if ($VSYSMainInputBox.TextLength -eq 0) {
            Write-Host "Empty Box"
            Invoke-GUIMessageBox "Conversion Resolution cannot be empty." -Title "Empty Value" -Buttons OK -Icon Error
        }else{
            Convert-OBJ2VOX -Paths $Files -Resolution $VSYSMainInputBox.Text
            $VSYSMainInputForm.Tag = $VSYSMainInputForm.close()
        }
    })

    $VSYSMainInputForm.ShowDialog()
}else{
    Convert-OBJ2VOX -Paths $Files -Resolution $Resolution
}

Remove-Item $FileList -Force


