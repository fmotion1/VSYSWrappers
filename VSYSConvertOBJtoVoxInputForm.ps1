[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')

#################################################################################
# The main form
#
$VSYSMainInputForm = New-Object -TypeName System.Windows.Forms.Form


Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

[System.Windows.Forms.Label]$VSYSLBLMain = $null
[System.Windows.Forms.TextBox]$VSYSMainInputBox = $null
[System.Windows.Forms.Button]$VSYSBTNConvert = $null
[System.Windows.Forms.Button]$VSYSBTNCancel = $null
[System.Windows.Forms.PictureBox]$VSYSPBBottomBG = $null
[System.Windows.Forms.Label]$VSYSLBLBottomNumFiles = $null
[System.Windows.Forms.PictureBox]$VSYSPBMainIcon = $null
[System.Windows.Forms.PictureBox]$VSYSPBBottomIcon = $null
[System.Windows.Forms.Button]$button1 = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'VSYSConvertOBJtoVoxResources')
$VSYSLBLMain = (New-Object -TypeName System.Windows.Forms.Label)
$VSYSMainInputBox = (New-Object -TypeName System.Windows.Forms.TextBox)
$VSYSBTNConvert = (New-Object -TypeName System.Windows.Forms.Button)
$VSYSBTNCancel = (New-Object -TypeName System.Windows.Forms.Button)
$VSYSPBBottomBG = (New-Object -TypeName System.Windows.Forms.PictureBox)
$VSYSLBLBottomNumFiles = (New-Object -TypeName System.Windows.Forms.Label)
$VSYSPBMainIcon = (New-Object -TypeName System.Windows.Forms.PictureBox)
$VSYSPBBottomIcon = (New-Object -TypeName System.Windows.Forms.PictureBox)
([System.ComponentModel.ISupportInitialize]$VSYSPBBottomBG).BeginInit()
([System.ComponentModel.ISupportInitialize]$VSYSPBMainIcon).BeginInit()
([System.ComponentModel.ISupportInitialize]$VSYSPBBottomIcon).BeginInit()
$VSYSMainInputForm.SuspendLayout()
#
#VSYSLBLMain
#
$VSYSLBLMain.AutoSize = $true
$VSYSLBLMain.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$VSYSLBLMain.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]24,[System.Int32]22))
$VSYSLBLMain.Name = [System.String]'VSYSLBLMain'
$VSYSLBLMain.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]238,[System.Int32]21))
$VSYSLBLMain.TabIndex = [System.Int32]0
$VSYSLBLMain.Text = [System.String]'Please enter a custom resolution:'
#
#VSYSMainInputBox
#

$VSYSMainInputBox.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]14.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$VSYSMainInputBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]28,[System.Int32]69))
$VSYSMainInputBox.Name = [System.String]'VSYSMainInputBox'
$VSYSMainInputBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]334,[System.Int32]33))
$VSYSMainInputBox.TabIndex = [System.Int32]1
$VSYSMainInputBox.BorderStyle = "FixedSingle"
$VSYSMainInputBox.MaxLength = 4
$VSYSMainInputBox.Add_TextChanged({
    $this.Text = $this.Text -replace '\D'
    $this.Select($this.Text.Length, 0);
})
#
#VSYSBTNConvert
#
$VSYSBTNConvert.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$VSYSBTNConvert.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]150)),([System.Int32]([System.Byte][System.Byte]150)),([System.Int32]([System.Byte][System.Byte]150)))
$VSYSBTNConvert.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]229)),([System.Int32]([System.Byte][System.Byte]229)),([System.Int32]([System.Byte][System.Byte]229)))
$VSYSBTNConvert.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]9.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$VSYSBTNConvert.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]287,[System.Int32]124))
$VSYSBTNConvert.Name = [System.String]'VSYSBTNConvert'
$VSYSBTNConvert.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]33))
$VSYSBTNConvert.TabIndex = [System.Int32]2
$VSYSBTNConvert.Text = [System.String]'Convert'
$VSYSBTNConvert.UseVisualStyleBackColor = $true
#
#VSYSBTNCancel
#
$VSYSBTNCancel.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$VSYSBTNCancel.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]150)),([System.Int32]([System.Byte][System.Byte]150)),([System.Int32]([System.Byte][System.Byte]150)))
$VSYSBTNCancel.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]229)),([System.Int32]([System.Byte][System.Byte]229)),([System.Int32]([System.Byte][System.Byte]229)))
$VSYSBTNCancel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]9.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$VSYSBTNCancel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]199,[System.Int32]124))
$VSYSBTNCancel.Name = [System.String]'VSYSBTNCancel'
$VSYSBTNCancel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]33))
$VSYSBTNCancel.TabIndex = [System.Int32]4
$VSYSBTNCancel.Text = [System.String]'Cancel'
$VSYSBTNCancel.UseVisualStyleBackColor = $true
$VSYSBTNCancel.Add_Click({$VSYSMainInputForm.Tag = $VSYSMainInputForm.close()})
#
#VSYSPBBottomBG
#
$VSYSPBBottomBG.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]224)),([System.Int32]([System.Byte][System.Byte]224)),([System.Int32]([System.Byte][System.Byte]224)))

$VSYSPBBottomBG.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]-5,[System.Int32]181))
$VSYSPBBottomBG.Name = [System.String]'VSYSPBBottomBG'
$VSYSPBBottomBG.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]401,[System.Int32]36))
$VSYSPBBottomBG.TabIndex = [System.Int32]5
$VSYSPBBottomBG.TabStop = $false
#
#VSYSLBLBottomNumFiles
#
$VSYSLBLBottomNumFiles.AutoSize = $true
$VSYSLBLBottomNumFiles.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]224)),([System.Int32]([System.Byte][System.Byte]224)),([System.Int32]([System.Byte][System.Byte]224)))

$VSYSLBLBottomNumFiles.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]9,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$VSYSLBLBottomNumFiles.ForeColor = [System.Drawing.SystemColors]::ControlText
$VSYSLBLBottomNumFiles.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]36,[System.Int32]186))
$VSYSLBLBottomNumFiles.Name = [System.String]'VSYSLBLBottomNumFiles'
$VSYSLBLBottomNumFiles.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]214,[System.Int32]15))
$VSYSLBLBottomNumFiles.TabIndex = [System.Int32]6
$VSYSLBLBottomNumFiles.Text = [System.String]'Number of files queued for conversion:'
#
#VSYSPBMainIcon
#
$VSYSPBMainIcon.BackgroundImage = ([System.Drawing.Image]$resources.'VSYSPBMainIcon.BackgroundImage')
$VSYSPBMainIcon.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]328,[System.Int32]17))
$VSYSPBMainIcon.Name = [System.String]'VSYSPBMainIcon'
$VSYSPBMainIcon.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]34,[System.Int32]30))
$VSYSPBMainIcon.TabIndex = [System.Int32]7
$VSYSPBMainIcon.TabStop = $false
#
#VSYSPBBottomIcon
#
$VSYSPBBottomIcon.BackColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]224)),([System.Int32]([System.Byte][System.Byte]224)),([System.Int32]([System.Byte][System.Byte]224)))

$VSYSPBBottomIcon.BackgroundImage = ([System.Drawing.Image]$resources.'VSYSPBBottomIcon.BackgroundImage')
$VSYSPBBottomIcon.BackgroundImageLayout = [System.Windows.Forms.ImageLayout]::Center
$VSYSPBBottomIcon.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]5,[System.Int32]182))
$VSYSPBBottomIcon.Name = [System.String]'VSYSPBBottomIcon'
$VSYSPBBottomIcon.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]30,[System.Int32]26))
$VSYSPBBottomIcon.TabIndex = [System.Int32]8
$VSYSPBBottomIcon.TabStop = $false
#
#VSYSMainInputForm
#
$VSYSMainInputForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]391,[System.Int32]211))
$VSYSMainInputForm.Controls.Add($VSYSPBBottomIcon)
$VSYSMainInputForm.Controls.Add($VSYSPBMainIcon)
$VSYSMainInputForm.Controls.Add($VSYSLBLBottomNumFiles)
$VSYSMainInputForm.Controls.Add($VSYSPBBottomBG)
$VSYSMainInputForm.Controls.Add($VSYSBTNCancel)
$VSYSMainInputForm.Controls.Add($VSYSBTNConvert)
$VSYSMainInputForm.Controls.Add($VSYSMainInputBox)
$VSYSMainInputForm.Controls.Add($VSYSLBLMain)
$iconBase64      = 'iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAABLFBMVEX///8hISEaGhobGxsiIiIaGhoZGRkREREQEBAUFBQPDw8fHx8hISEiIiIiIiIcHBwfHx8dHUUcHERMJKZKIqUiIiIhISFdKsNqN8pbKMEhISEiIiI5ImZdKsOrXW2qW2tbKMFhLsciIiIzH1tHJ4UxMTEGBAgGBQgyMjJZM6RhLsceHh45OTknJyc/ImlPLYJRL4Q/I2pVVVUwMGMyMmULCwsKCgoeHh6cnJz///9TU1MiIiKBgYHNzc1ISEgeHiotIEtaOjExIFMfHyofHyw0JWw3HHPZkGySYqM3HHQ0JW0aGjdfPaGCSlDvonLvvo6DYWcbGzdsSp+RUapfOTRgS0WSX7d6S7s5JVYPDREPDhI6Jld6S7odETI5OTkdEjNCLiQQEBAeFicfFijlqhyyAAAANXRSTlMBP3HPOc9xcdktcXHp43FxJ7Ozj49NfxGzETOhHYv19YsNQ9+Rvc3NvXlZTaur7R0d7V9vEf0cKqIAAAABYktHRACIBR1IAAAAB3RJTUUH5gEKExklkHD7nQAAALVJREFUGNNFy1USwkAQBNDBg7u7u8sCi7sEd7f734GCbKB/evpVDQAAhwPfsA1cHv9TfIGQgChPiQHEVEFCQIqQTC6XISQloCiWyhiXS0UFC5VqDeNatfIDXG80W402/kGn2+sPhqMOC8oxPZnO5vRCSUClXq7Wm+1SoyIA2t3+cDyddWTqDUbTBV1vJjOzLVab3XF/PO5Ol5sRj9fnfwaCr1A4Qn6isXgimUrHM/BPNpfLMtcbzroaCKo1ntAAAAAldEVYdGRhdGU6Y3JlYXRlADIwMjEtMTAtMDFUMTg6MTA6MDgrMDA6MDDl1gtZAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDIxLTEwLTAxVDE4OjEwOjA4KzAwOjAwlIuz5QAAAABJRU5ErkJggg=='
$iconBytes       = [Convert]::FromBase64String($iconBase64)
$stream          = [System.IO.MemoryStream]::new($iconBytes, 0, $iconBytes.Length)
$VSYSMainInputForm.Icon = [System.Drawing.Icon]::FromHandle(([System.Drawing.Bitmap]::new($stream).GetHIcon()))
$VSYSMainInputForm.Text = "Convert STL or OBJ to VOX Format"
$VSYSMainInputForm.TopMost = $True
$VSYSMainInputForm.MaximizeBox = $false
$VSYSMainInputForm.MinimizeBox = $false
$VSYSMainInputForm.FormBorderStyle = 'FixedDialog'
$VSYSMainInputForm.Name = [System.String]'VSYSMainInputForm'
$VSYSMainInputForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen



([System.ComponentModel.ISupportInitialize]$VSYSPBBottomBG).EndInit()
([System.ComponentModel.ISupportInitialize]$VSYSPBMainIcon).EndInit()
([System.ComponentModel.ISupportInitialize]$VSYSPBBottomIcon).EndInit()
$VSYSMainInputForm.ResumeLayout($false)
$VSYSMainInputForm.PerformLayout()
Add-Member -InputObject $VSYSMainInputForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $VSYSMainInputForm -Name VSYSLBLMain -Value $VSYSLBLMain -MemberType NoteProperty
Add-Member -InputObject $VSYSMainInputForm -Name VSYSMainInputBox -Value $VSYSMainInputBox -MemberType NoteProperty
Add-Member -InputObject $VSYSMainInputForm -Name VSYSBTNConvert -Value $VSYSBTNConvert -MemberType NoteProperty
Add-Member -InputObject $VSYSMainInputForm -Name VSYSBTNCancel -Value $VSYSBTNCancel -MemberType NoteProperty
Add-Member -InputObject $VSYSMainInputForm -Name VSYSPBBottomBG -Value $VSYSPBBottomBG -MemberType NoteProperty
Add-Member -InputObject $VSYSMainInputForm -Name VSYSLBLBottomNumFiles -Value $VSYSLBLBottomNumFiles -MemberType NoteProperty
Add-Member -InputObject $VSYSMainInputForm -Name VSYSPBMainIcon -Value $VSYSPBMainIcon -MemberType NoteProperty
Add-Member -InputObject $VSYSMainInputForm -Name VSYSPBBottomIcon -Value $VSYSPBBottomIcon -MemberType NoteProperty
Add-Member -InputObject $VSYSMainInputForm -Name button1 -Value $button1 -MemberType NoteProperty
}
. InitializeComponent
