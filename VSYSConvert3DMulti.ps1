param (

    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory)]
    [ValidateSet('obj','fbx','stl','gltf','glb','dae','3ds','blend', IgnoreCase = $true)]
    [String]
    $SourceFormat,

    [Parameter(Mandatory)]
    [ValidateSet('obj','fbx','blend', IgnoreCase = $true)]
    [String]
    $DestFormat

)


$Files = Get-Content $FileList
if(!$Files){
    throw [System.Exception] "File list is empty."
}

. (Join-Path $PSScriptRoot 'VSYSConvert3DMultiForm.ps1')


function Test-AssimpChecked {
    if($CHKUseAssimp.Checked){
        $COMBOImportMethod.Enabled = $false
        $COMBOExportMethod.Enabled = $false
    }else{
        $COMBOImportMethod.Enabled = $true
        $COMBOExportMethod.Enabled = $true
    }
}

$timer = New-Object System.Windows.Forms.Timer -Property @{Interval = 100}
$timer.start()
$timer.add_Tick({

    $UpperSourceFormat = $SourceFormat.ToUpper()
    $UpperDestFormat = $DestFormat.ToUpper()

    $LBLMainHeader.text = [System.String] "$UpperSourceFormat to $UpperDestFormat Conversion"

    $LBLImportMethod.text = [System.String] "$UpperSourceFormat Import Method"
    $LBLExportMethod.text = [System.String] "$UpperDestFormat Export Method"

    $FilesNum = @($Files).Length
    $LBLStatusBar.text=[System.String]"$FilesNum Files Currently Selected for Conversion. "

    switch ($SourceFormat) {
        {($_ -eq "fbx") -or ($_ -eq "obj") -or ($_ -eq "dae")} {
            $COMBOImportMethod.Items.Add("Better FBX Importer")
            $COMBOImportMethod.Items.Add("Standard Blender Importer")
            $COMBOImportMethod.SelectedIndex = 0
        }
        
        "3ds" {
            $CHKUseAssimp.Checked = $true
            $CHKUseAssimp.Enabled = $false
            Test-AssimpChecked
            break
        }
        {($_ -eq "stl") -or ($_ -eq "gltf") -or ($_ -eq "glb")} {
            $COMBOImportMethod.Items.Add("Standard Blender Importer")
            $COMBOImportMethod.SelectedIndex = 0
            break
        }
        "blend" {
            $COMBOImportMethod.Items.Add("Standard Blender Importer")
            $COMBOImportMethod.SelectedIndex = 0
            break
        }
        default {
            throw [System.Exception] "An unsupported source format was supplied."
        }
    }
    
    if($SourceFormat -ne "3ds"){
        switch ($DestFormat) {
            "fbx" {
                $COMBOExportMethod.Items.Add("Better FBX Exporter")
                $COMBOExportMethod.Items.Add("Standard Blender Exporter")
                $COMBOExportMethod.SelectedIndex = 0
            }
            "obj" {
                $COMBOExportMethod.Items.Add("Standard Blender Exporter")
                $COMBOExportMethod.SelectedIndex = 0
            }
            "blend" {
                $COMBOExportMethod.Items.Add("Native Blender Export")
                $COMBOExportMethod.SelectedIndex = 0
                $CHKUseAssimp.Enabled = $false
                $CHKUseAssimp.Checked = $false
                $CHKUseAssimp.Text = 'Use Assimp Instead (Incompatible)'
                break
            }
        }
    }
    
    $timer.Stop()
})



function Start-Conversion {

    $BetterImportString = ""
    $BetterExportString = ""

    if($COMBOImportMethod.SelectedItem -eq "Better FBX Importer"){
        $BetterImportString = "-bimport"
    }
    if($COMBOExportMethod.SelectedItem -eq "Better FBX Exporter"){
        $BetterExportString = "-bexport"
    }

    foreach ($File in $Files) {

        $Directory    = [System.IO.Path]::GetDirectoryName($File)
        $Filename     = [System.IO.Path]::GetFileNameWithoutExtension($File)
        $NewFile      = $Directory + '\' + $Filename + "." + $DestFormat
        $TempFile     = $Directory + '\' + $Filename + "." + 'fbx'

        if($CHKUseAssimp.Checked){

            # Assimpd cannot export .blend files. 
            # So we convert to FBX first and then convert to Blend
            # This is currently not used, but under consideration.
            if($DestFormat -eq "blend"){
                assimpd.exe export `"$File`" `"$TempFile`" | Out-Null
                blender --background --python 'C:\Tools\scripts\VSYSConvert3DMulti.py' -- -i `"$TempFile`" -o `"$NewFile`" | Out-Null
                Remove-Item -LiteralPath $TempFile -Force
            }else{
                assimpd.exe export `"$File`" `"$NewFile`" | Out-Null
            }
            continue
        }

        blender --background --python 'C:\Tools\scripts\VSYSConvert3DMulti.py' -- -i `"$File`" -o `"$NewFile`" $BetterImportString $BetterExportString | Out-Null
    }

    $Convert3DForm.close()
}

$CHKUseAssimp.add_CheckedChanged({Test-AssimpChecked})


$BTNCancel.Add_Click({ 
    $Convert3DForm.Tag = $Convert3DForm.close()
})

$BTNConvert.Add_Click({
    Start-Conversion
})

$Convert3DForm.add_Closing({
    [environment]::exit(0)
})

$Convert3DForm.ShowDialog()

Remove-Item $FileList -Force