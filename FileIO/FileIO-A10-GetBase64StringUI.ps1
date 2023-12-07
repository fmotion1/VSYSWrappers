param (
    [Parameter(Mandatory=$false,Position = 0)]
    [String]
    $FileList
)

. (Join-Path $PSScriptRoot 'FileIO-A10-GetBase64StringUI-Form.ps1')

$FilesCollection = New-Object System.Collections.ArrayList

# Populate CBOX if files were passed in via context menu
# Also populate $FilesCollection
if($FileList){

    $obj = [PSCustomObject]@{
        Filepath    = $null
        Filename    = $null
    }

    $FilesCollection.Add($obj) | Out-Null
    $CBOXLoadedFiles.Items.Add("Select a loaded file") | Out-Null

    $Files = Get-Content $FileList
    foreach ($File in $Files) {
        $obj = [PSCustomObject]@{
            Filepath    = $File
            Filename    = [System.IO.Path]::GetFileName($File)
        }
        $FilesCollection.Add($obj) | Out-Null
        $CBOXLoadedFiles.Items.Add($obj.Filename) | Out-Null
    }

} else {

    $obj = [PSCustomObject]@{
        Index       = 0
        Filepath    = $null
        Filename    = $null
    }
    $FilesCollection.Add($obj) | Out-Null
    $CBOXLoadedFiles.Items.Add("Click browse to add files to process.")
}

$CBOXLoadedFiles.SelectedIndex = 0

$SelectedFileChanged = {

    if ($CBOXLoadedFiles.SelectedIndex -eq 0) {
        $TBOXBase64String.Text = ""
        return
    }

    $sb = [System.Text.StringBuilder]::new()
    $P = $FilesCollection[$CBOXLoadedFiles.SelectedIndex].Filepath
    $B64String = [System.convert]::ToBase64String((Get-Content -LiteralPath $P -AsByteStream -Raw))
    $sb.Append($B64String)

    $TBOXBase64String.Text = $sb.ToString()
}

##################################################
# Event handlers

$BTNCopy.Add_Click({
    if($TBOXBase64String.Text -ne ""){
        [System.Windows.Forms.Clipboard]::SetText($TBOXBase64String.Text)
        Invoke-VBMessageBox "Copied full string to clipboard."
    }
})

$BTNBrowse.Add_Click({

    $SelectedFiles = Invoke-OpenFileDialog -MultiSelect

    foreach ($File in $SelectedFiles) {
        $obj = [PSCustomObject]@{
            Filepath    = $File
            Filename    = [System.IO.Path]::GetFileName($File)
        }
        $FilesCollection.Add($obj) | Out-Null
        $CBOXLoadedFiles.Items.Add($obj.Filename) | Out-Null
    }
})


$BTNClear.Add_Click({

    $FilesCollection.Clear()
    $CBOXLoadedFiles.Items.Clear()
    $CBOXLoadedFiles.Text = ""

    $obj = [PSCustomObject]@{
        Filepath    = $null
        Filename    = $null
    }

    $FilesCollection.Add($obj)

    $CBOXLoadedFiles.Items.Add("Click browse to add files to process.")
    $CBOXLoadedFiles.SelectedIndex = 0
    $TBOXBase64String.Text.Clear

})

$ContextMenuCopy.Add_Click({

    [System.Windows.Forms.Clipboard]::SetText($TBOXBase64String.SelectedText)
    #$TBOXBase64String.Copy()
})


$CBOXLoadedFiles.add_SelectedIndexChanged($SelectedFileChanged)

$GetBase64StringForm.add_Closing({
    Remove-Item $FileList -Force
    [environment]::exit(0)
})

$BTNClose.Add_Click({
    $CloseResult = $GetBase64StringForm.Close()
    if($CloseResult -eq 'Cancel'){
        Remove-Item $FileList -Force
        [environment]::exit(0)
    }
})

$LINKLBLGithub.Add_Click({
    start "http://www.github.com/fmotion1"
})

##################################################
# Show Dialog

$GetBase64StringForm.ShowDialog()