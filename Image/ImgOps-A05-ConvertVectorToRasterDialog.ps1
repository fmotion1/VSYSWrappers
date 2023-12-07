param (
    [Parameter(Mandatory,Position = 0)]
    [String]
    $FileList
)

. (Join-Path $PSScriptRoot 'ImgOps-A05-ConvertVectorToRasterDialog-Form.ps1')

$timer = New-Object System.Windows.Forms.Timer -Property @{Interval = 100}
$timer.start()
$timer.add_Tick({
    $FilesNum = @($Files).Length
    if($FilesNum -eq 1){
        $SourceFileType = (([System.IO.Path]::GetExtension($Files)).Replace('.','')).ToLower()
    }else{
        $SourceFileType = (([System.IO.Path]::GetExtension($Files[0])).Replace('.','')).ToLower()
    }

    $LBLSelectedFiles.text = [System.String]"$FilesNum $($SourceFileType.ToUpper()) Files Queued for Conversion."

    $COMBOOutputFormat.SelectedIndex = 0
    $COMBOScaleFactor.SelectedIndex = 0

    $timer.Stop()
})

$Files = Get-Content $FileList

function Start-Conversion {

    $Files | ForEach-Object -Parallel {

        $File  = $_
        $SourceFormat = (([System.IO.Path]::GetExtension($File)).Replace('.','')).ToLower()
        $Filename = [System.IO.Path]::GetFileNameWithoutExtension($File)
        $FileDirectory  = [System.IO.Path]::GetDirectoryName($File)
        $TempDirectory = (New-TempDirectory -Length 10).FullName
        $DestFormat = (($Using:COMBOOutputFormat).SelectedItem).ToLower()

        $ConvertedFile = $TempDirectory + '\' + $Filename + '-%d' + ".$DestFormat"
        $ConvertedFileFromSVG = $TempDirectory + '\' + $Filename + ".$DestFormat"

        switch (($Using:COMBOScaleFactor).SelectedItem) {
            "1x (Original Size)" {
                $ScaleFactor = 1
                break
            }
            "2x" {
                $ScaleFactor = 2
                break
            }
            "3x" {
                $ScaleFactor = 3
                break
            }
            "4x" {
                $ScaleFactor = 4
                break
            }
            "5x" {
                $ScaleFactor = 5
                break
            }
        }

        $DPI = 72 * $ScaleFactor
        $DPIString = 72 * $ScaleFactor
        $DPIString = $DPIString.ToString()
        $DPIString = "-r$DPIString"

        switch ($DestFormat) {
            "png" {
                if($SourceFormat -eq 'svg'){
                    magick -background none -density $DPI $File -resize 100% `"$ConvertedFileFromSVG`"
                    break
                }else{
                    #Density at 72 = Screen DPI, Outputs exact size of artboard
                    gswin64c -dGraphicsAlphaBits=4 -dSAFER -dBATCH -dNOPAUSE -dEPSCrop -sDEVICE=png16m $DPIString $PageListString -sDEVICE=pngalpha "-sOutputFile=$ConvertedFile" $File
                    break
                }
            }
            "jpg" {
                if($SourceFormat -eq 'svg'){
                    magick -density $DPI $File -resize 100% `"$ConvertedFileFromSVG`"
                }else{
                    gswin64c -dGraphicsAlphaBits=4 -dSAFER -dBATCH -dNOPAUSE -dEPSCrop -sDEVICE=jpeg -dJPEGQ=100 $DPIString $PageListString "-sOutputFile=$ConvertedFile" $File
                }
            }
        }

        $TempFiles = Get-ChildItem -LiteralPath $TempDirectory

        foreach ($TempFile in $TempFiles) {

            if(($TempFile.FullName) -eq ($TempDirectory + '\' + $Filename + '-1' + ".$DestFormat")){
                $NewTempFile = Rename-Item $TempFile -NewName ($Filename + ".$DestFormat") -PassThru
                $TempFile = $NewTempFile.FullName
            }

            $TempFileDir  = [System.IO.Path]::GetDirectoryName($TempFile)
            $TempFilename = [System.IO.Path]::GetFileNameWithoutExtension($TempFile)
            $TempFileExt  = [System.IO.Path]::GetExtension($TempFile)

            $TestFileFull = $FileDirectory + '\' + $TempFilename + $TempFileExt
            $ActualFilename = $TempFileDir + '\' + $TempFilename + $TempFileExt

            $Idx = 2
            $DuplicateFound = $false
            while (Test-Path -LiteralPath $TestFileFull -PathType Leaf) {
                $DuplicateFound = $true
                $TestFileFull = $FileDirectory + '\' + $TempFilename + " ($Idx)" + $TempFileExt
                $UpdatedFileName = $TempFilename + " ($Idx)" + $TempFileExt
                $Idx++
            }

            if($DuplicateFound){
                Rename-Item $ActualFilename -NewName $UpdatedFileName
                Move-Item ($TempFileDir + '\' + $UpdatedFileName) -Destination $FileDirectory
            }else{
                Move-Item $ActualFilename -Destination $FileDirectory
            }
        }
    } -ThrottleLimit 20

    $VectorToRaster.Tag = $VectorToRaster.close()

}

$BTNCancel.Add_Click({
    $VectorToRaster.Tag = $VectorToRaster.close()
})

$BTNConvert.Add_Click({
    Start-Conversion
})

$VectorToRaster.add_Closing({
    [environment]::exit(0)
})

$VectorToRaster.ShowDialog()

Remove-Item $FileList -Force