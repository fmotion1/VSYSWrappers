[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')


$GetBase64StringForm = New-Object -TypeName System.Windows.Forms.Form

Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()

[System.Windows.Forms.Button]$BTNCopy                   = $null
[System.Windows.Forms.ComboBox]$CBOXLoadedFiles         = $null
[System.Windows.Forms.Button]$BTNClose                  = $null
[System.Windows.Forms.Button]$BTNBrowse                 = $null
[System.Windows.Forms.Button]$BTNClear                  = $null
[System.Windows.Forms.PictureBox]$IMGVisusys            = $null
[System.Windows.Forms.Panel]$PANELTopHeader             = $null
[System.Windows.Forms.PictureBox]$IMGMainIcon           = $null
[System.Windows.Forms.PictureBox]$IMGMainHeader         = $null
[System.Windows.Forms.Label]$LBLSelectLoadedFile        = $null
[System.Windows.Forms.Label]$LBLBrowseForFile           = $null
[System.Windows.Forms.LinkLabel]$LINKLBLGithub          = $null
[System.Windows.Forms.RichTextBox]$TBOXBase64String     = $null
[System.ComponentModel.IContainer]$components           = $null
[System.Windows.Forms.ToolStripMenuItem]$Copy           = $null
[System.Windows.Forms.ContextMenuStrip]$ContextMenuCopy = $null
function InitializeComponent
{
$components           = (New-Object -TypeName System.ComponentModel.Container)
$resources            = . (Join-Path $PSScriptRoot 'VSYSBase64GetStringResources.ps1')
$BTNCopy              = (New-Object -TypeName System.Windows.Forms.Button)
$PANELTopHeader       = (New-Object -TypeName System.Windows.Forms.Panel)
$IMGMainIcon          = (New-Object -TypeName System.Windows.Forms.PictureBox)
$IMGMainHeader        = (New-Object -TypeName System.Windows.Forms.PictureBox)
$CBOXLoadedFiles      = (New-Object -TypeName System.Windows.Forms.ComboBox)
$LBLSelectLoadedFile  = (New-Object -TypeName System.Windows.Forms.Label)
$BTNClose             = (New-Object -TypeName System.Windows.Forms.Button)
$BTNBrowse            = (New-Object -TypeName System.Windows.Forms.Button)
$BTNClear             = (New-Object -TypeName System.Windows.Forms.Button)
$IMGVisusys           = (New-Object -TypeName System.Windows.Forms.PictureBox)
$LBLBrowseForFile     = (New-Object -TypeName System.Windows.Forms.Label)
$LINKLBLGithub        = (New-Object -TypeName System.Windows.Forms.LinkLabel)
$TBOXBase64String     = (New-Object -TypeName System.Windows.Forms.RichTextBox)
$ContextMenuCopy      = (New-Object -TypeName System.Windows.Forms.ContextMenuStrip -ArgumentList @($components))
$Copy                 = (New-Object -TypeName System.Windows.Forms.ToolStripMenuItem)

$PANELTopHeader.SuspendLayout()

([System.ComponentModel.ISupportInitialize]$IMGMainIcon).BeginInit()
([System.ComponentModel.ISupportInitialize]$IMGMainHeader).BeginInit()
([System.ComponentModel.ISupportInitialize]$IMGVisusys).BeginInit()

$ContextMenuCopy.SuspendLayout()
$GetBase64StringForm.SuspendLayout()

#
#BTNCopy
#
$BTNCopy.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNCopy.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]719,[System.Int32]402))
$BTNCopy.Name = [System.String]'BTNCopy'
$BTNCopy.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]118,[System.Int32]44))
$BTNCopy.TabIndex = [System.Int32]1
$BTNCopy.Text = [System.String]'Copy String'
$BTNCopy.UseVisualStyleBackColor = $true
#
#PANELTopHeader
#
$PANELTopHeader.BackColor = [System.Drawing.Color]::Black
$PANELTopHeader.Controls.Add($IMGMainIcon)
$PANELTopHeader.Controls.Add($IMGMainHeader)
$PANELTopHeader.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]-2,[System.Int32]-4))
$PANELTopHeader.Name = [System.String]'PANELTopHeader'
$PANELTopHeader.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]871,[System.Int32]87))
$PANELTopHeader.TabIndex = [System.Int32]3
#
#IMGMainIcon
#
$IMGMainIcon.Image = ([System.Drawing.Image]$resources.'IMGMainIcon.Image')
$IMGMainIcon.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]805,[System.Int32]24))
$IMGMainIcon.Name = [System.String]'IMGMainIcon'
$IMGMainIcon.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]34,[System.Int32]42))
$IMGMainIcon.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$IMGMainIcon.TabIndex = [System.Int32]1
$IMGMainIcon.TabStop = $false
#
#IMGMainHeader
#
$IMGMainHeader.Image = ([System.Drawing.Image]$resources.'IMGMainHeader.Image')
$IMGMainHeader.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]28,[System.Int32]32))
$IMGMainHeader.Name = [System.String]'IMGMainHeader'
$IMGMainHeader.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]473,[System.Int32]30))
$IMGMainHeader.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$IMGMainHeader.TabIndex = [System.Int32]0
$IMGMainHeader.TabStop = $false
#
#CBOXLoadedFiles
#
$CBOXLoadedFiles.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$CBOXLoadedFiles.FormattingEnabled = $true
$CBOXLoadedFiles.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]26,[System.Int32]132))
$CBOXLoadedFiles.Name = [System.String]'CBOXLoadedFiles'
$CBOXLoadedFiles.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]320,[System.Int32]31))
$CBOXLoadedFiles.TabIndex = [System.Int32]5
$CBOXLoadedFiles.add_SelectedIndexChanged($CBOXLoadedFiles_SelectedIndexChanged)
#
#LBLSelectLoadedFile
#
$LBLSelectLoadedFile.AutoSize = $true
$LBLSelectLoadedFile.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$LBLSelectLoadedFile.ForeColor = [System.Drawing.Color]::DimGray
$LBLSelectLoadedFile.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]23,[System.Int32]101))
$LBLSelectLoadedFile.Name = [System.String]'LBLSelectLoadedFile'
$LBLSelectLoadedFile.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]142,[System.Int32]20))
$LBLSelectLoadedFile.TabIndex = [System.Int32]6
$LBLSelectLoadedFile.Text = [System.String]'Select a Loaded File'
#
#BTNClose
#
$BTNClose.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BTNClose.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]590,[System.Int32]402))
$BTNClose.Name = [System.String]'BTNClose'
$BTNClose.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]118,[System.Int32]44))
$BTNClose.TabIndex = [System.Int32]7
$BTNClose.Text = [System.String]'Close'
$BTNClose.UseVisualStyleBackColor = $true
#
#BTNBrowse
#
$BTNBrowse.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12))
$BTNBrowse.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]363,[System.Int32]131))
$BTNBrowse.Name = [System.String]'BTNBrowse'
$BTNBrowse.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]91,[System.Int32]33))
$BTNBrowse.TabIndex = [System.Int32]10
$BTNBrowse.Text = [System.String]'Browse'
$BTNBrowse.UseVisualStyleBackColor = $true
#
#BTNClear
#
$BTNClear.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]12))
$BTNClear.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]470,[System.Int32]131))
$BTNClear.Name = [System.String]'BTNClear'
$BTNClear.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]91,[System.Int32]33))
$BTNClear.TabIndex = [System.Int32]10
$BTNClear.Text = [System.String]'Clear All'
$BTNClear.UseVisualStyleBackColor = $true
#
#IMGVisusys
#
$IMGVisusys.Image = ([System.Drawing.Image]$resources.'IMGVisusys.Image')
$IMGVisusys.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]412))
$IMGVisusys.Name = [System.String]'IMGVisusys'
$IMGVisusys.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]78,[System.Int32]23))
$IMGVisusys.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$IMGVisusys.TabIndex = [System.Int32]11
$IMGVisusys.TabStop = $false
#
#LBLBrowseForFile
#
$LBLBrowseForFile.AutoSize = $true
$LBLBrowseForFile.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$LBLBrowseForFile.ForeColor = [System.Drawing.Color]::DimGray
$LBLBrowseForFile.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]362,[System.Int32]101))
$LBLBrowseForFile.Name = [System.String]'LBLBrowseForFile'
$LBLBrowseForFile.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]139,[System.Int32]20))
$LBLBrowseForFile.TabIndex = [System.Int32]12
$LBLBrowseForFile.Text = [System.String]'Or Browse for a File'
#
#LINKLBLGithub
#
$LINKLBLGithub.ActiveLinkColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$LINKLBLGithub.AutoSize = $true
$LINKLBLGithub.DisabledLinkColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$LINKLBLGithub.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$LINKLBLGithub.LinkBehavior = [System.Windows.Forms.LinkBehavior]::NeverUnderline
$LINKLBLGithub.LinkColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$LINKLBLGithub.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]111,[System.Int32]412))
$LINKLBLGithub.Name = [System.String]'LINKLBLGithub'
$LINKLBLGithub.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]134,[System.Int32]20))
$LINKLBLGithub.TabIndex = [System.Int32]13
$LINKLBLGithub.TabStop = $true
$LINKLBLGithub.Text = [System.String]'github.com/visusys'
$LINKLBLGithub.VisitedLinkColor = [System.Drawing.Color]::FromArgb(([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)),([System.Int32]([System.Byte][System.Byte]64)))

$LINKLBLGithub.add_LinkClicked($linkLabel1_LinkClicked)
#
#TBOXBase64String
#
$TBOXBase64String.BorderStyle       = [System.Windows.Forms.BorderStyle]::FixedSingle
$TBOXBase64String.BackColor         = [System.Drawing.Color]::FromArgb(255, 255, 255)
$TBOXBase64String.ContextMenuStrip  = $ContextMenuCopy
$TBOXBase64String.Font              = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Segoe UI',[System.Single]11.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$TBOXBase64String.Location          = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]27,[System.Int32]183))
$TBOXBase64String.Name              = [System.String]'TBOXBase64String'
$TBOXBase64String.ReadOnly          = $true
$TBOXBase64String.ScrollBars        = [System.Windows.Forms.RichTextBoxScrollBars]::Vertical
$TBOXBase64String.Size              = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]810,[System.Int32]202))
$TBOXBase64String.TabIndex          = [System.Int32]15
$TBOXBase64String.Text              = [System.String]''
#
#ContextMenuCopy
#
$ContextMenuCopy.Items.AddRange([System.Windows.Forms.ToolStripItem[]]@($Copy))
$ContextMenuCopy.Name = [System.String]'contextMenuStrip1'
$ContextMenuCopy.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]103,[System.Int32]26))
$ContextMenuCopy.add_Opening($contextMenuStrip1_Opening)
#
#Copy
#
$Copy.Name = [System.String]'Copy'
$Copy.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]102,[System.Int32]22))
$Copy.Text = [System.String]'Copy'
#
#GetBase64StringForm
#
$GetBase64StringForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]866,[System.Int32]468))
$GetBase64StringForm.Controls.Add($TBOXBase64String)
$GetBase64StringForm.Controls.Add($LINKLBLGithub)
$GetBase64StringForm.Controls.Add($LBLBrowseForFile)
$GetBase64StringForm.Controls.Add($IMGVisusys)
$GetBase64StringForm.Controls.Add($BTNBrowse)
$GetBase64StringForm.Controls.Add($BTNClear)
$GetBase64StringForm.Controls.Add($BTNClose)
$GetBase64StringForm.Controls.Add($LBLSelectLoadedFile)
$GetBase64StringForm.Controls.Add($CBOXLoadedFiles)
$GetBase64StringForm.Controls.Add($PANELTopHeader)
$GetBase64StringForm.Controls.Add($BTNCopy)
$GetBase64StringForm.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$GetBase64StringForm.MaximizeBox = $false
$GetBase64StringForm.MinimizeBox = $false
$GetBase64StringForm.Name = [System.String]'GetBase64StringForm'
$GetBase64StringForm.ShowIcon = $false
$GetBase64StringForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$GetBase64StringForm.TopMost = $true
$PANELTopHeader.ResumeLayout($false)
$PANELTopHeader.PerformLayout()
([System.ComponentModel.ISupportInitialize]$IMGMainIcon).EndInit()
([System.ComponentModel.ISupportInitialize]$IMGMainHeader).EndInit()
([System.ComponentModel.ISupportInitialize]$IMGVisusys).EndInit()
$ContextMenuCopy.ResumeLayout($false)
$GetBase64StringForm.ResumeLayout($false)
$GetBase64StringForm.PerformLayout()
Add-Member -InputObject $GetBase64StringForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name BTNCopy -Value $BTNCopy -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name CBOXLoadedFiles -Value $CBOXLoadedFiles -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name BTNClose -Value $BTNClose -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name BTNBrowse -Value $BTNBrowse -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name BTNClear -Value $BTNClear -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name IMGVisusys -Value $IMGVisusys -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name PANELTopHeader -Value $PANELTopHeader -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name IMGMainIcon -Value $IMGMainIcon -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name IMGMainHeader -Value $IMGMainHeader -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name LBLSelectLoadedFile -Value $LBLSelectLoadedFile -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name LBLBrowseForFile -Value $LBLBrowseForFile -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name LINKLBLGithub -Value $LINKLBLGithub -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name TBOXBase64String -Value $TBOXBase64String -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name components -Value $components -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name Copy -Value $Copy -MemberType NoteProperty
Add-Member -InputObject $GetBase64StringForm -Name ContextMenuCopy -Value $ContextMenuCopy -MemberType NoteProperty
}
. InitializeComponent
