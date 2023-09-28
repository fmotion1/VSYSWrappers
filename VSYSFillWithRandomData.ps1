param (
    [Parameter(Mandatory,Position=0)]
    [String]$Path
)

# Begin Initialization ##############################################################################
#

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()


# Begin Form Layout #################################################################################
#

$RandomDataForm                             = New-Object system.Windows.Forms.Form
$CenterScreen                               = [System.Windows.Forms.FormStartPosition]::CenterScreen
$RandomDataForm.StartPosition               = $CenterScreen
$RandomDataForm.FormBorderStyle             = 'Fixed3D'
$RandomDataForm.ClientSize                  = '580,430'
$RandomDataForm.text                        = "VSYSFileOps Random Data Generator"
$RandomDataForm.BackColor                   = "#F9F9FB"
$RandomDataForm.MaximizeBox                 = $false

$MainLabel                                  = New-Object system.Windows.Forms.Label
$MainLabel.text                             = "VSYS Random Data Generator"
$MainLabel.AutoSize                         = $true
$MainLabel.width                            = 25
$MainLabel.height                           = 10
$MainLabel.location                         = New-Object System.Drawing.Point(20,20)
$MainLabel.Font                             = 'Segoe UI,16'

$FileSizesLabel                             = New-Object system.Windows.Forms.Label
$FileSizesLabel.text                        = "File sizes to generate:"
$FileSizesLabel.AutoSize                    = $true
$FileSizesLabel.width                       = 25
$FileSizesLabel.height                      = 10
$FileSizesLabel.location                    = New-Object System.Drawing.Point(23,70)
$FileSizesLabel.Font                        = 'Segoe UI,11'

$FileSizesCombo                             = New-Object System.Windows.Forms.ComboBox
$FileSizesCombo.text                        = "Testing"
$FileSizesCombo.width                       = 250
$FileSizesCombo.autosize                    = $true
$FileSizesCombo.DropDownStyle               = "DropDownList"

@('Tiny (5-20KB)','Small (300-500KB)','Medium (15-30MB)','Large (100-200MB)','Huge (1-3GB)') | ForEach-Object {[void] $FileSizesCombo.Items.Add($_)}

$FileSizesCombo.SelectedIndex               = 1
$FileSizesCombo.location                    = New-Object System.Drawing.Point(25,100)
$FileSizesCombo.Font                        = 'Segoe UI,13'

$NumFilesLabel                              = New-Object system.Windows.Forms.Label
$NumFilesLabel.text                         = "Number of files to generate:"
$NumFilesLabel.AutoSize                     = $true
$NumFilesLabel.width                        = 25
$NumFilesLabel.height                       = 10
$NumFilesLabel.location                     = New-Object System.Drawing.Point(298,70)
$NumFilesLabel.Font                         = 'Segoe UI,11'

$NumFilesCombo                              = New-Object System.Windows.Forms.ComboBox
$NumFilesCombo.text                         = "Testing"
$NumFilesCombo.width                        = 250
$NumFilesCombo.autosize                     = $true
$NumFilesCombo.DropDownStyle                = "DropDownList"

@('5','10','20','35','60','120','200','1000','5000','10000','50000','100000') | ForEach-Object {[void] $NumFilesCombo.Items.Add($_)}

$NumFilesCombo.SelectedIndex                = 3
$NumFilesCombo.location                     = New-Object System.Drawing.Point(300,100)
$NumFilesCombo.Font                         = 'Segoe UI,13'

$ExtensionsLabel                            = New-Object system.Windows.Forms.Label
$ExtensionsLabel.text                       = "Choose output file extensions:"
$ExtensionsLabel.AutoSize                   = $true
$ExtensionsLabel.width                      = 25
$ExtensionsLabel.height                     = 10
$ExtensionsLabel.location                   = New-Object System.Drawing.Point(23,150)
$ExtensionsLabel.Font                       = 'Segoe UI,11'

$ExtensionsCombo                            = New-Object System.Windows.Forms.ComboBox
$ExtensionsCombo.text                       = "Testing"
$ExtensionsCombo.width                      = 525
$ExtensionsCombo.autosize                   = $true
$ExtensionsCombo.DropDownStyle              = "DropDownList"

@(
    'Completely Random Extensions',
    'Images (png, jpg, jpeg, webm, tiff, psd, bmp)',
    'Video (mp4, mov, wmv, avi, mkv)',
    'Documents (txt, doc, docx, rtf, pdf)',
    'Fonts (ttf, otf, woff, woff2)',
    'System (exe, bat, cmd, com, vbs, dll)',
    'Audio (mp3, flac, wav, aiff)',
    'Web (html, css, php, dhtml, js, json, aspx)')
    | ForEach-Object {[void] $ExtensionsCombo.Items.Add($_)}

$ExtensionsCombo.SelectedIndex              = 0
$ExtensionsCombo.location                   = New-Object System.Drawing.Point(25,180)
$ExtensionsCombo.Font                       = 'Segoe UI,12'

$FilenameLengthMinLabel                     = New-Object system.Windows.Forms.Label
$FilenameLengthMinLabel.text                = "Minimum Filename Length:"
$FilenameLengthMinLabel.AutoSize            = $true
$FilenameLengthMinLabel.width               = 25
$FilenameLengthMinLabel.height              = 10
$FilenameLengthMinLabel.location            = New-Object System.Drawing.Point(23,230)
$FilenameLengthMinLabel.Font                = 'Segoe UI,11'

$FilenameLengthMaxLabel                     = New-Object system.Windows.Forms.Label
$FilenameLengthMaxLabel.text                = "Maximum Filename Length:"
$FilenameLengthMaxLabel.AutoSize            = $true
$FilenameLengthMaxLabel.width               = 25
$FilenameLengthMaxLabel.height              = 10
$FilenameLengthMaxLabel.location            = New-Object System.Drawing.Point(298,230)
$FilenameLengthMaxLabel.Font                = 'Segoe UI,12'

$FilenameLengthMinTB                        = New-Object system.Windows.Forms.TextBox
$FilenameLengthMinTB.multiline              = $false
$FilenameLengthMinTB.width                  = 250
$FilenameLengthMinTB.height                 = 60
$FilenameLengthMinTB.location               = New-Object System.Drawing.Point(23,265)
$FilenameLengthMinTB.Font                   = 'Segoe UI,12'
$FilenameLengthMinTB.Visible                = $true
$FilenameLengthMinTB.SelectedText           = 7
$FilenameLengthMinTB.MaxLength              = 2
$FilenameLengthMinTB.Add_TextChanged({
    $this.Text = $this.Text -replace '\D'
    $this.Select($this.Text.Length, 0);
})

$FilenameLengthMaxTB                        = New-Object system.Windows.Forms.TextBox
$FilenameLengthMaxTB.multiline              = $false
$FilenameLengthMaxTB.width                  = 250
$FilenameLengthMaxTB.height                 = 60
$FilenameLengthMaxTB.location               = New-Object System.Drawing.Point(300,265)
$FilenameLengthMaxTB.Font                   = 'Segoe UI,12'
$FilenameLengthMaxTB.Visible                = $true
$FilenameLengthMaxTB.MaxLength              = 2
$FilenameLengthMaxTB.SelectedText           = 16
$FilenameLengthMaxTB.Add_TextChanged({
    $this.Text = $this.Text -replace '\D'
    $this.Select($this.Text.Length, 0);
})

$CurrentFolderPanel                         = New-Object System.Windows.Forms.Panel
$CurrentFolderPanel.BackColor               = "#FFFFFF"
$CurrentFolderPanel.width                   = 580
$CurrentFolderPanel.height                  = 45
$CurrentFolderPanel.location                = New-Object System.Drawing.Point(0,391)
$CurrentFolderPanel.ForeColor               = "#120F0E"

$CurrentFolderLabel                         = New-Object System.Windows.Forms.Label
$CurrentFolderLabel.text                    = "Current output folder: $Path"
$CurrentFolderLabel.AutoSize                = $true
$CurrentFolderLabel.width                   = 200
$CurrentFolderLabel.height                  = 10
$CurrentFolderLabel.location                = New-Object System.Drawing.Point(20,400)
$CurrentFolderLabel.Font                    = 'Segoe UI,10'
$CurrentFolderLabel.BackColor               = "#FFFFFF"
$CurrentFolderLabel.ForeColor               = "#333A3F"

$GenerateButton                             = New-Object system.Windows.Forms.Button
$GenerateButton.BackColor                   = "#E1E1E1"
$GenerateButton.text                        = "Generate"
$GenerateButton.width                       = 120
$GenerateButton.height                      = 45
$GenerateButton.location                    = New-Object System.Drawing.Point(431,320)
$GenerateButton.Font                        = 'Segoe UI,11'
$GenerateButton.ForeColor                   = "#120F0E"
$GenerateButton.UseVisualStyleBackColor     = $true

$CancelButton                               = New-Object system.Windows.Forms.Button
$CancelButton.BackColor                     = "#E1E1E1"
$CancelButton.text                          = "Cancel"
$CancelButton.width                         = 120
$CancelButton.height                        = 45
$CancelButton.location                      = New-Object System.Drawing.Point(300,320)
$CancelButton.Font                          = 'Segoe UI,11'
$CancelButton.ForeColor                     = "#120F0E"
$CancelButton.UseVisualStyleBackColor       = $true
$CancelButton.DialogResult                  = [System.Windows.Forms.DialogResult]::Cancel

$RandomDataForm.controls.AddRange(@(
    $MainLabel,
    $CurrentFolderLabel,
    $CurrentFolderPanel,
    $GenerateButton,
    $CancelButton,
    $ExtensionsLabel,
    $FilenameLengthMinLabel,
    $FilenameLengthMaxLabel,
    $FilenameLengthMaxTB,
    $FilenameLengthMinTB,
    $FileSizesLabel,
    $NumFilesLabel,
    $FileSizesCombo,
    $ExtensionsCombo,
    $NumFilesCombo
))
#
# End Form Layout ##############################################################################


# Functions ####################################################################################
#
function BeginFormValidation {
    [Int32]$Max = $FilenameLengthMaxTB.Text
    [Int32]$Min = $FilenameLengthMinTB.Text

    $IsValid = $true

    if($Min -gt $Max){
        $Message = "Error: Minimum Filename Length is Greater than Maximum. Please correct this to continue."
        [System.Windows.Forms.MessageBox]::Show($Message, "Error", "Ok", "Hand")
        $IsValid = $false
    }
    if($Min -lt 3){
        $Message = "Error: Minimum Filename Length is less than three. Please correct this to continue."
        [System.Windows.Forms.MessageBox]::Show($Message, "Error", "Ok", "Hand")
        $IsValid = $false
    }
    if($Max -gt 60){
        $Message = "Error: Maximum Filename Length is greater than 60. Please choose a smaller value to continue."
        [System.Windows.Forms.MessageBox]::Show($Message, "Error", "Ok", "Hand")
        $IsValid = $false
    }
    if($IsValid){
        $RandomDataForm.DialogResult = 'Ok'
        GenerateRandomData
    }
}

function GenerateRandomData {
    switch ($ExtensionsCombo.SelectedItem) {
        'Completely Random Extensions' {
            $SelectedExtensions = ''
        }
        'Images (png, jpg, jpeg, webm, tiff, psd, bmp)' {
            $SelectedExtensions = @('png', 'jpg', 'jpeg', 'webm', 'tiff', 'psd', 'bmp')
        }
        'Video (mp4, mov, wmv, avi, mkv)' {
            $SelectedExtensions = @('mp4', 'mov', 'wmv', 'avi', 'mkv')
        }
        'Documents (txt, doc, docx, rtf, pdf)' {
            $SelectedExtensions = @('txt', 'doc', 'docx', 'rtf', 'pdf')
        }
        'Fonts (ttf, otf, woff, woff2)' {
            $SelectedExtensions = @('ttf', 'otf', 'woff', 'woff2')
        }
        'System (exe, bat, cmd, com, vbs, dll)' {
            $SelectedExtensions = @('exe', 'bat', 'cmd', 'com', 'vbs', 'dll')
        }
        'Audio (mp3, flac, wav, aiff)' {
            $SelectedExtensions = @('mp3', 'flac', 'wav', 'aiff')
        }
        'Web (html, css, php, dhtml, js, json, aspx)' {
            $SelectedExtensions = @('html', 'css', 'php', 'dhtml', 'js', 'json', 'aspx')
        }
    }

    [Int32]$MinFileLength = $FilenameLengthMinTB.Text
    [Int32]$MaxFileLength = $FilenameLengthMaxTB.Text

    $SelectedNumFiles = [Int32]$NumFilesCombo.SelectedItem

    switch ($FileSizesCombo.SelectedItem) {
        'Tiny (5-20KB)' {
            $SelectedSizesMin = 5
            $SelectedSizesMax = 20
            $SelectedSizesUnit = 'KB'
        }
        'Small (300-500KB)' {
            $SelectedSizesMin = 300
            $SelectedSizesMax = 500
            $SelectedSizesUnit = 'KB'
        }
        'Medium (15-30MB)' {
            $SelectedSizesMin = 15
            $SelectedSizesMax = 30
            $SelectedSizesUnit = 'MB'
        }
        'Large (100-200MB)' {
            $SelectedSizesMin = 100
            $SelectedSizesMax = 200
            $SelectedSizesUnit = 'MB'
        }
        'Huge (1-3GB)' {
            $SelectedSizesMin = 1
            $SelectedSizesMax = 3
            $SelectedSizesUnit = 'GB'
        }
    }
    if($SelectedExtensions -eq ''){
        Write-Host "Saving random data. File extensions were not passed." -ForegroundColor Cyan
        Save-RandomDataToFiles -OutputPath $Path -FilenameLengthMin $MinFileLength -FilenameLengthMax $MaxFileLength -FilesizeMin $SelectedSizesMin -FilesizeMax $SelectedSizesMax -Unit $SelectedSizesUnit -NumberOfFiles $SelectedNumFiles -RandomFileExtensions
    }else{
        Write-Host "Saving random data. File extensions were passed." -ForegroundColor Cyan
        Save-RandomDataToFiles -OutputPath $Path -FilenameLengthMin $MinFileLength -FilenameLengthMax $MaxFileLength -FilesizeMin $SelectedSizesMin -FilesizeMax $SelectedSizesMax -Unit $SelectedSizesUnit -NumberOfFiles $SelectedNumFiles -FileExtensions $SelectedExtensions
    }
}

# Script #######################################################################################
#

$GenerateButton.Add_Click({ BeginFormValidation })
$RandomDataForm.add_Closing({
    # Do NOT use a normal Exit command, or you will get a nasty .NET System Error.
    # https://stackoverflow.com/questions/8155617/how-can-you-exit-a-windows-forms-application-from-within-an-event-handler-functi
    # [environment]::exit(0)
})

# Show Form ####################################################################################
#

[void]$RandomDataForm.ShowDialog()