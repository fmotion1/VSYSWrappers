param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Switch]
    $NoEmbed,

    [Parameter(Mandatory=$false)]
    [Switch]
    $KeepTempFolders
)

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationCore,PresentationFramework
Add-Type -AssemblyName Microsoft.VisualBasic
[System.Windows.Forms.Application]::EnableVisualStyles()

$FBXFiles = Get-Content $FileList

foreach ($FBX in $FBXFiles) {

    $Directory    = [System.IO.Path]::GetDirectoryName($FBX)
    $Filename     = [System.IO.Path]::GetFileNameWithoutExtension($FBX)
    $OldFile      = $FBX
    $NewDirectory = $Directory + '\' + 'Converted' + '\'


    if(!(Test-Path -LiteralPath $NewDirectory -PathType Container)){
        New-Item -Path $NewDirectory -ItemType Directory -Force | Out-Null
    }

    $NewFile = $NewDirectory + $Filename + ".fbx"
    $NewTempDir = $Directory + '\' + $Filename + ".fbm"

    $Index = 1
    while (Test-Path -LiteralPath $NewFile -PathType Leaf) {
        $NewFile = $NewDirectory + $Filename + " ($Index).fbx"
        $Index++
    }

    if($NoEmbed){
        FBXCONVERTER.exe `"$OldFile`" `"$NewFile`" /v /l /f201300 /-e /binary | Out-Null
    }else{
        FBXCONVERTER.exe `"$OldFile`" `"$NewFile`" /v /l /f201300 /e /binary | Out-Null
    }

    if(Test-Path -LiteralPath $NewTempDir -PathType Container){
        if(!$KeepTempFolders){
            Remove-Item -LiteralPath $NewTempDir -Force -Recurse
        }
    }
}

Remove-Item $FileList -Force

[Microsoft.VisualBasic.Interaction]::MsgBox('FBX Conversion Complete','OKOnly,SystemModal,Information', 'Conversion Complete')
