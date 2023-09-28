[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')

#################################################################################
# The main form
#
$Convert3DForm = New-Object -TypeName System.Windows.Forms.Form


Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

[System.Windows.Forms.Label]$LBLMainHeader = $null
[System.Windows.Forms.Label]$LBLStatusBar = $null
[System.Windows.Forms.PictureBox]$PICTSmallIcon = $null
[System.Windows.Forms.ComboBox]$COMBOImportMethod = $null
[System.Windows.Forms.Label]$LBLImportMethod = $null
[System.Windows.Forms.Label]$LBLExportMethod = $null
[System.Windows.Forms.ComboBox]$COMBOExportMethod = $null
[System.Windows.Forms.CheckBox]$CHKUseAssimp = $null
[System.Windows.Forms.PictureBox]$PICTIcon = $null
[System.Windows.Forms.Button]$BTNCancel = $null
[System.Windows.Forms.Button]$BTNConvert = $null
[System.Windows.Forms.Panel]$PANELStatusBar = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'VSYSConvert3DMultiFormResources.ps1')
$LBLMainHeader = (New-Object -TypeName System.Windows.Forms.Label)
$LBLStatusBar = (New-Object -TypeName System.Windows.Forms.Label)
$PANELStatusBar = (New-Object -TypeName System.Windows.Forms.Panel)
$PICTSmallIcon = (New-Object -TypeName System.Windows.Forms.PictureBox)
$COMBOImportMethod = (New-Object -TypeName System.Windows.Forms.ComboBox)
$LBLImportMethod = (New-Object -TypeName System.Windows.Forms.Label)
$LBLExportMethod = (New-Object -TypeName System.Windows.Forms.Label)
$COMBOExportMethod = (New-Object -TypeName System.Windows.Forms.ComboBox)
$CHKUseAssimp = (New-Object -TypeName System.Windows.Forms.CheckBox)
$PICTIcon = (New-Object -TypeName System.Windows.Forms.PictureBox)
$BTNCancel = (New-Object -TypeName System.Windows.Forms.Button)
$BTNConvert = (New-Object -TypeName System.Windows.Forms.Button)
$PANELStatusBar.SuspendLayout()
([System.ComponentModel.ISupportInitialize]$PICTSmallIcon).BeginInit()
([System.ComponentModel.ISupportInitialize]$PICTIcon).BeginInit()
$Convert3DForm.SuspendLayout()


#
#LBLMainHeader
#
$LBLMainHeader.AutoSize = $true
$LBLMainHeader.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI Semilight',[System.Single]18,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$LBLMainHeader.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]25,[System.Int32]27))
$LBLMainHeader.Name = [System.String]'LBLMainHeader'
$LBLMainHeader.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]215,[System.Int32]32))
$LBLMainHeader.TabIndex = [System.Int32]0
$LBLMainHeader.Text = [System.String]'OBJ File Conversion'
$LBLMainHeader.add_Click($label1_Click)


#
#LBLStatusBar
#
$LBLStatusBar.AutoSize = $true
$LBLStatusBar.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]224)),([System.Int32]([System.Byte][System.Byte]224)),([System.Int32]([System.Byte][System.Byte]224)))

$LBLStatusBar.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]10))
$LBLStatusBar.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$LBLStatusBar.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]28,[System.Int32]295))
$LBLStatusBar.Name = [System.String]'LBLStatusBar'
$LBLStatusBar.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]256,[System.Int32]19))
$LBLStatusBar.TabIndex = [System.Int32]1
$LBLStatusBar.Text = [System.String]'2 Files Currently Selected for Conversion
'
$LBLStatusBar.add_Click($label2_Click)


#
#PANELStatusBar
#
$PANELStatusBar.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]224)),([System.Int32]([System.Byte][System.Byte]224)),([System.Int32]([System.Byte][System.Byte]224)))

$PANELStatusBar.Controls.Add($PICTSmallIcon)
$PANELStatusBar.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]-5,[System.Int32]284))
$PANELStatusBar.Name = [System.String]'PANELStatusBar'
$PANELStatusBar.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]629,[System.Int32]44))
$PANELStatusBar.TabIndex = [System.Int32]2


#
#PICTSmallIcon
#
$PICTSmallIcon.Image = ([System.Drawing.Image]$resources.'PICTSmallIcon.Image')
$PICTSmallIcon.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]13,[System.Int32]12))
$PICTSmallIcon.Name = [System.String]'PICTSmallIcon'
$PICTSmallIcon.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]16,[System.Int32]16))
$PICTSmallIcon.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$PICTSmallIcon.TabIndex = [System.Int32]13
$PICTSmallIcon.TabStop = $false


#
#COMBOImportMethod
#
$COMBOImportMethod.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$COMBOImportMethod.FormattingEnabled = $true
$COMBOImportMethod.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]31,[System.Int32]142))
$COMBOImportMethod.Name = [System.String]'COMBOImportMethod'
$COMBOImportMethod.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]268,[System.Int32]29))
$COMBOImportMethod.TabIndex = [System.Int32]3
$COMBOImportMethod.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList; 


#
#LBLImportMethod
#
$LBLImportMethod.AutoSize = $true
$LBLImportMethod.BackColor = [System.Drawing.SystemColors]::Control
$LBLImportMethod.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11))
$LBLImportMethod.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$LBLImportMethod.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]111))
$LBLImportMethod.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$LBLImportMethod.Name = [System.String]'LBLImportMethod'
$LBLImportMethod.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]139,[System.Int32]20))
$LBLImportMethod.TabIndex = [System.Int32]4
$LBLImportMethod.Text = [System.String]'OBJ Import Method'


#
#LBLExportMethod
#
$LBLExportMethod.AutoSize = $true
$LBLExportMethod.BackColor = [System.Drawing.SystemColors]::Control
$LBLExportMethod.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11))
$LBLExportMethod.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$LBLExportMethod.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]316,[System.Int32]111))
$LBLExportMethod.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$LBLExportMethod.Name = [System.String]'LBLExportMethod'
$LBLExportMethod.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]137,[System.Int32]20))
$LBLExportMethod.TabIndex = [System.Int32]6
$LBLExportMethod.Text = [System.String]'FBX Export Method'


#
#COMBOExportMethod
#
$COMBOExportMethod.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$COMBOExportMethod.FormattingEnabled = $true
$COMBOExportMethod.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]320,[System.Int32]142))
$COMBOExportMethod.Name = [System.String]'COMBOExportMethod'
$COMBOExportMethod.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]266,[System.Int32]29))
$COMBOExportMethod.TabIndex = [System.Int32]5
$COMBOExportMethod.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList; 

#
#CHKUseAssimp
#
$CHKUseAssimp.AutoSize = $true
$CHKUseAssimp.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$CHKUseAssimp.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]31,[System.Int32]188))
$CHKUseAssimp.Name = [System.String]'CHKUseAssimp'
$CHKUseAssimp.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]156,[System.Int32]24))
$CHKUseAssimp.TabIndex = [System.Int32]8
$CHKUseAssimp.Text = [System.String]'Use Assimp Instead'
$CHKUseAssimp.UseVisualStyleBackColor = $true


#
#PICTIcon
#
$PICTIcon.Image = ([System.Drawing.Image]$resources.'PICTIcon.Image')
$PICTIcon.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]509,[System.Int32]18))
$PICTIcon.Name = [System.String]'PICTIcon'
$PICTIcon.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]76,[System.Int32]86))
$PICTIcon.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$PICTIcon.TabIndex = [System.Int32]9
$PICTIcon.TabStop = $false


#
#BTNCancel
#
$BTNCancel.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$BTNCancel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNCancel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]320,[System.Int32]219))
$BTNCancel.Name = [System.String]'BTNCancel'
$BTNCancel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]129,[System.Int32]41))
$BTNCancel.TabIndex = [System.Int32]11
$BTNCancel.Text = [System.String]'Cancel'
$BTNCancel.UseVisualStyleBackColor = $true


#
#BTNConvert
#
$BTNConvert.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNConvert.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]462,[System.Int32]219))
$BTNConvert.Name = [System.String]'BTNConvert'
$BTNConvert.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]129,[System.Int32]41))
$BTNConvert.TabIndex = [System.Int32]12
$BTNConvert.Text = [System.String]'Convert'
$BTNConvert.UseVisualStyleBackColor = $true


#
#Convert3DForm
#
$Convert3DForm.AcceptButton = $BTNConvert
$Convert3DForm.CancelButton = $BTNCancel
$Convert3DForm.FormBorderStyle = 'FixedDialog'
$Convert3DForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]616,[System.Int32]323))
$Convert3DForm.Controls.Add($BTNConvert)
$Convert3DForm.Controls.Add($BTNCancel)
$Convert3DForm.Controls.Add($PICTIcon)
$Convert3DForm.Controls.Add($CHKUseAssimp)
$Convert3DForm.Controls.Add($LBLExportMethod)
$Convert3DForm.Controls.Add($COMBOExportMethod)
$Convert3DForm.Controls.Add($LBLImportMethod)
$Convert3DForm.Controls.Add($COMBOImportMethod)
$Convert3DForm.Controls.Add($LBLStatusBar)
$Convert3DForm.Controls.Add($LBLMainHeader)
$Convert3DForm.Controls.Add($PANELStatusBar)
$Convert3DForm.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$Convert3DForm.MaximizeBox = $false
$Convert3DForm.MinimizeBox = $false
$Convert3DForm.Name = [System.String]'Convert3DForm'
$Convert3DForm.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$Convert3DForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$Convert3DForm.Text = [System.String]'Visusys 3D Format Converter'
$Convert3DForm.TopMost = $true
$PANELStatusBar.ResumeLayout($false)
$PANELStatusBar.PerformLayout()
([System.ComponentModel.ISupportInitialize]$PICTSmallIcon).EndInit()
([System.ComponentModel.ISupportInitialize]$PICTIcon).EndInit()
$Convert3DForm.ResumeLayout($false)
$Convert3DForm.PerformLayout()
Add-Member -InputObject $Convert3DForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name LBLMainHeader -Value $LBLMainHeader -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name LBLStatusBar -Value $LBLStatusBar -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name PICTSmallIcon -Value $PICTSmallIcon -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name COMBOImportMethod -Value $COMBOImportMethod -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name LBLImportMethod -Value $LBLImportMethod -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name LBLExportMethod -Value $LBLExportMethod -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name COMBOExportMethod -Value $COMBOExportMethod -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name CHKUseAssimp -Value $CHKUseAssimp -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name PICTIcon -Value $PICTIcon -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name BTNCancel -Value $BTNCancel -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name BTNConvert -Value $BTNConvert -MemberType NoteProperty
Add-Member -InputObject $Convert3DForm -Name PANELStatusBar -Value $PANELStatusBar -MemberType NoteProperty
}
. InitializeComponent
