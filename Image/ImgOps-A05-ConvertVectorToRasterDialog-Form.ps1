[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')


$VectorToRaster = New-Object -TypeName System.Windows.Forms.Form
$CenterScreen = [System.Windows.Forms.FormStartPosition]::CenterScreen
$VectorToRaster.StartPosition = $CenterScreen

Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

[System.Windows.Forms.Label]$LBLSelectedFiles = $null
[System.Windows.Forms.Button]$BTNConvert = $null
[System.Windows.Forms.Button]$BTNCancel = $null
[System.Windows.Forms.ComboBox]$COMBOScaleFactor = $null
[System.Windows.Forms.Label]$LBLScaleFactor = $null
[System.Windows.Forms.Panel]$PANELScaleFactor = $null
[System.Windows.Forms.PictureBox]$PICTHeader = $null
[System.Windows.Forms.PictureBox]$PICTLargeIcon = $null
[System.Windows.Forms.ProgressBar]$PBARConversionProcess = $null
[System.Windows.Forms.Label]$LBLConversionProgress = $null
[System.Windows.Forms.PictureBox]$PICTSmallIcon = $null
[System.Windows.Forms.Panel]$PANELOutputFormat = $null
[System.Windows.Forms.Label]$LBLOutputFormat = $null
[System.Windows.Forms.ComboBox]$COMBOOutputFormat = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'ImgOps-A05-ConvertVectorToRasterDialog-Resources.ps1')
$LBLSelectedFiles = (New-Object -TypeName System.Windows.Forms.Label)
$BTNConvert = (New-Object -TypeName System.Windows.Forms.Button)
$BTNCancel = (New-Object -TypeName System.Windows.Forms.Button)
$COMBOScaleFactor = (New-Object -TypeName System.Windows.Forms.ComboBox)
$LBLScaleFactor = (New-Object -TypeName System.Windows.Forms.Label)
$PANELScaleFactor = (New-Object -TypeName System.Windows.Forms.Panel)
$PICTHeader = (New-Object -TypeName System.Windows.Forms.PictureBox)
$PICTLargeIcon = (New-Object -TypeName System.Windows.Forms.PictureBox)
$PBARConversionProcess = (New-Object -TypeName System.Windows.Forms.ProgressBar)
$LBLConversionProgress = (New-Object -TypeName System.Windows.Forms.Label)
$PICTSmallIcon = (New-Object -TypeName System.Windows.Forms.PictureBox)
$PANELOutputFormat = (New-Object -TypeName System.Windows.Forms.Panel)
$LBLOutputFormat = (New-Object -TypeName System.Windows.Forms.Label)
$COMBOOutputFormat = (New-Object -TypeName System.Windows.Forms.ComboBox)
$PANELScaleFactor.SuspendLayout()
([System.ComponentModel.ISupportInitialize]$PICTHeader).BeginInit()
([System.ComponentModel.ISupportInitialize]$PICTLargeIcon).BeginInit()
([System.ComponentModel.ISupportInitialize]$PICTSmallIcon).BeginInit()
$PANELOutputFormat.SuspendLayout()
$VectorToRaster.SuspendLayout()
#
#LBLSelectedFiles
#
$LBLSelectedFiles.AutoSize = $true
$LBLSelectedFiles.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI Semilight',[System.Single]9))
$LBLSelectedFiles.ForeColor = [System.Drawing.SystemColors]::GrayText
$LBLSelectedFiles.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]53,[System.Int32]352))
$LBLSelectedFiles.Name = [System.String]'LBLSelectedFiles'
$LBLSelectedFiles.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]181,[System.Int32]15))
$LBLSelectedFiles.TabIndex = [System.Int32]1
$LBLSelectedFiles.Text = [System.String]'1 EPS File Selected for Conversion'
#
#BTNConvert
#
$BTNConvert.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNConvert.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]377,[System.Int32]342))
$BTNConvert.Name = [System.String]'BTNConvert'
$BTNConvert.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]90,[System.Int32]35))
$BTNConvert.TabIndex = [System.Int32]2
$BTNConvert.Text = [System.String]'Convert'
$BTNConvert.UseVisualStyleBackColor = $true
#
#BTNCancel
#
$BTNCancel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNCancel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]271,[System.Int32]342))
$BTNCancel.Name = [System.String]'BTNCancel'
$BTNCancel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]90,[System.Int32]35))
$BTNCancel.TabIndex = [System.Int32]3
$BTNCancel.Text = [System.String]'Cancel'
$BTNCancel.UseVisualStyleBackColor = $true
#
#COMBOScaleFactor
#
$COMBOScaleFactor.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$COMBOScaleFactor.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$COMBOScaleFactor.FormattingEnabled = $true
$COMBOScaleFactor.Items.AddRange([System.Object[]]@([System.String]'1x (Original Size)',[System.String]'2x',[System.String]'3x',[System.String]'4x',[System.String]'5x'))
$COMBOScaleFactor.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]252,[System.Int32]13))
$COMBOScaleFactor.Name = [System.String]'COMBOScaleFactor'
$COMBOScaleFactor.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]173,[System.Int32]29))
$COMBOScaleFactor.TabIndex = [System.Int32]4
#
#LBLScaleFactor
#
$LBLScaleFactor.AutoSize = $true
$LBLScaleFactor.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI Semilight',[System.Single]11))
$LBLScaleFactor.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$LBLScaleFactor.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]17))
$LBLScaleFactor.Name = [System.String]'LBLScaleFactor'
$LBLScaleFactor.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]216,[System.Int32]20))
$LBLScaleFactor.TabIndex = [System.Int32]5
$LBLScaleFactor.Text = [System.String]'DPI Scale Factor (Value * 72 DPI)'
#
#PANELScaleFactor
#
$PANELScaleFactor.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]234)),([System.Int32]([System.Byte][System.Byte]234)),([System.Int32]([System.Byte][System.Byte]234)))

$PANELScaleFactor.Controls.Add($LBLScaleFactor)
$PANELScaleFactor.Controls.Add($COMBOScaleFactor)
$PANELScaleFactor.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]26,[System.Int32]181))
$PANELScaleFactor.Name = [System.String]'PANELScaleFactor'
$PANELScaleFactor.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]439,[System.Int32]56))
$PANELScaleFactor.TabIndex = [System.Int32]6
#
#PICTHeader
#
$PICTHeader.Image = ([System.Drawing.Image]$resources.'PICTHeader.Image')
$PICTHeader.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]26,[System.Int32]28))
$PICTHeader.Name = [System.String]'PICTHeader'
$PICTHeader.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]334,[System.Int32]39))
$PICTHeader.TabIndex = [System.Int32]7
$PICTHeader.TabStop = $false
#
#PICTLargeIcon
#
$PICTLargeIcon.Image = ([System.Drawing.Image]$resources.'PICTLargeIcon.Image')
$PICTLargeIcon.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]426,[System.Int32]22))
$PICTLargeIcon.Name = [System.String]'PICTLargeIcon'
$PICTLargeIcon.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]48,[System.Int32]62))
$PICTLargeIcon.TabIndex = [System.Int32]8
$PICTLargeIcon.TabStop = $false
#
#PBARConversionProcess
#
$PBARConversionProcess.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]287))
$PBARConversionProcess.Name = [System.String]'PBARConversionProcess'
$PBARConversionProcess.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]439,[System.Int32]30))
$PBARConversionProcess.TabIndex = [System.Int32]9
#
#LBLConversionProgress
#
$LBLConversionProgress.AutoSize = $true
$LBLConversionProgress.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]9.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$LBLConversionProgress.ForeColor = [System.Drawing.SystemColors]::ControlDarkDark
$LBLConversionProgress.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]23,[System.Int32]259))
$LBLConversionProgress.Name = [System.String]'LBLConversionProgress'
$LBLConversionProgress.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]129,[System.Int32]17))
$LBLConversionProgress.TabIndex = [System.Int32]10
$LBLConversionProgress.Text = [System.String]'Conversion Progress'
#
#PICTSmallIcon
#
$PICTSmallIcon.Image = ([System.Drawing.Image]$resources.'PICTSmallIcon.Image')
$PICTSmallIcon.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]23,[System.Int32]348))
$PICTSmallIcon.Name = [System.String]'PICTSmallIcon'
$PICTSmallIcon.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]23,[System.Int32]25))
$PICTSmallIcon.TabIndex = [System.Int32]11
$PICTSmallIcon.TabStop = $false
#
#PANELOutputFormat
#
$PANELOutputFormat.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]234)),([System.Int32]([System.Byte][System.Byte]234)),([System.Int32]([System.Byte][System.Byte]234)))

$PANELOutputFormat.Controls.Add($LBLOutputFormat)
$PANELOutputFormat.Controls.Add($COMBOOutputFormat)
$PANELOutputFormat.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]26,[System.Int32]102))
$PANELOutputFormat.Name = [System.String]'PANELOutputFormat'
$PANELOutputFormat.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]439,[System.Int32]56))
$PANELOutputFormat.TabIndex = [System.Int32]7
#
#LBLOutputFormat
#
$LBLOutputFormat.AutoSize = $true
$LBLOutputFormat.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI Semilight',[System.Single]11))
$LBLOutputFormat.ForeColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$LBLOutputFormat.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]19,[System.Int32]17))
$LBLOutputFormat.Name = [System.String]'LBLOutputFormat'
$LBLOutputFormat.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]131,[System.Int32]20))
$LBLOutputFormat.TabIndex = [System.Int32]5
$LBLOutputFormat.Text = [System.String]'Output File Format'
#
#COMBOOutputFormat
#
$COMBOOutputFormat.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$COMBOOutputFormat.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$COMBOOutputFormat.FormattingEnabled = $true
$COMBOOutputFormat.Items.AddRange([System.Object[]]@([System.String]'PNG',[System.String]'JPG'))
$COMBOOutputFormat.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]252,[System.Int32]13))
$COMBOOutputFormat.Name = [System.String]'COMBOOutputFormat'
$COMBOOutputFormat.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]173,[System.Int32]29))
$COMBOOutputFormat.TabIndex = [System.Int32]4
#
#VectorToRaster
#
$VectorToRaster.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]493,[System.Int32]402))
$VectorToRaster.Controls.Add($PANELOutputFormat)
$VectorToRaster.Controls.Add($PICTSmallIcon)
$VectorToRaster.Controls.Add($LBLConversionProgress)
$VectorToRaster.Controls.Add($PBARConversionProcess)
$VectorToRaster.Controls.Add($PICTLargeIcon)
$VectorToRaster.Controls.Add($PICTHeader)
$VectorToRaster.Controls.Add($BTNCancel)
$VectorToRaster.Controls.Add($BTNConvert)
$VectorToRaster.Controls.Add($LBLSelectedFiles)
$VectorToRaster.Controls.Add($PANELScaleFactor)
$VectorToRaster.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$VectorToRaster.Icon = ([System.Drawing.Icon]$resources.'$this.Icon')
$VectorToRaster.MaximizeBox = $false
$VectorToRaster.MinimizeBox = $false
$VectorToRaster.Name = [System.String]'VectorToRaster'
$VectorToRaster.Text = [System.String]'Vector to Raster Converter'
$VectorToRaster.TopMost = $true
$PANELScaleFactor.ResumeLayout($false)
$PANELScaleFactor.PerformLayout()
([System.ComponentModel.ISupportInitialize]$PICTHeader).EndInit()
([System.ComponentModel.ISupportInitialize]$PICTLargeIcon).EndInit()
([System.ComponentModel.ISupportInitialize]$PICTSmallIcon).EndInit()
$PANELOutputFormat.ResumeLayout($false)
$PANELOutputFormat.PerformLayout()
$VectorToRaster.ResumeLayout($false)
$VectorToRaster.PerformLayout()
Add-Member -InputObject $VectorToRaster -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name LBLSelectedFiles -Value $LBLSelectedFiles -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name BTNConvert -Value $BTNConvert -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name BTNCancel -Value $BTNCancel -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name COMBOScaleFactor -Value $COMBOScaleFactor -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name LBLScaleFactor -Value $LBLScaleFactor -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name PANELScaleFactor -Value $PANELScaleFactor -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name PICTHeader -Value $PICTHeader -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name PICTLargeIcon -Value $PICTLargeIcon -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name PBARConversionProcess -Value $PBARConversionProcess -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name LBLConversionProgress -Value $LBLConversionProgress -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name PICTSmallIcon -Value $PICTSmallIcon -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name PANELOutputFormat -Value $PANELOutputFormat -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name LBLOutputFormat -Value $LBLOutputFormat -MemberType NoteProperty
Add-Member -InputObject $VectorToRaster -Name COMBOOutputFormat -Value $COMBOOutputFormat -MemberType NoteProperty
}
. InitializeComponent
