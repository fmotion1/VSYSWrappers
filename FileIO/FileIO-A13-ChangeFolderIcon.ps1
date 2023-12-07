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

    [Parameter(Mandatory = $false)]
    [switch]
    $Reset
)

$Folders = Get-Content $FileList
if(!$Folders){
    throw [System.Exception] "Folder list is empty."
}

if (!($Reset)) {
    
    # Initialize Winforms
    Add-Type -AssemblyName System.Windows.Forms
    [System.Windows.Forms.Application]::EnableVisualStyles()

    # Set up the form to host the File Browser
    # Clean this up later. Not sure how to center the File Browser.
    # TopMost is set to ensure the file browser appears on top of everything
    $Form = New-Object 'System.Windows.Forms.Form' -Property @{ TopMost = $true }
    $Form.ShowIcon = $false
    $Form.StartPosition = "manual"
    $Screen = [System.Windows.Forms.Screen]::PrimaryScreen
    $ScreenW = $Screen.Bounds.Width
    $ScreenH = $Screen.Bounds.Height
    $Point = [System.Drawing.Point]::new((($ScreenW / 2) - ($Form.Width / 2) - 400), (($ScreenH / 2) - ($Form.Height / 2) - 230))
    $Form.Location = $Point

    # Create and initialize the File Browser
    # Limit filter to .ico files
    $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog
    $FileBrowser.Filter = 'Windows Icon Files (*.ico)|*.ico'
    $FileBrowser.Title = "Choose a folder icon"

    # Set the initial directory to my icons folder
    # This is just a little shortcut specific to my setup
    # Otherwise set to Desktop
    if (Test-Path -LiteralPath "C:\Tools\icons" -PathType Container) {
        $FileBrowser.InitialDirectory = "C:\Tools\icons"
    } else {
        $FileBrowser.InitialDirectory = [Environment]::GetFolderPath('Desktop')
    }

    # Show the Dialog
    if ($FileBrowser.ShowDialog($Form) -ne "OK") { Exit }

    # This is our selected Icon
    $Icon = $FileBrowser.FileName

    Set-FolderIcon $Folders -Icon $Icon

} else {

    # Reset was called, so reset all icons.
    Set-FolderIcon $Folders -Reset

}

Remove-Item $FileList -Force