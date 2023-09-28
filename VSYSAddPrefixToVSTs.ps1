
$Vendor = "airwindows"
$Prefix = "AIRW "

$VST2TargetNfos = Get-ChildItem "C:\Users\futur\Documents\Image-Line\FL Studio\Presets\Plugin database\Installed\Effects\VST" -Force -Filter *.nfo | Select-String "ps_file_vendorname_0=$Vendor" -List | Select-Object Path
$VST2TargetFsts = Get-ChildItem "C:\Users\futur\Documents\Image-Line\FL Studio\Presets\Plugin database\Installed\Effects\VST" -Force -Filter *.fst | Select-String "ps_file_vendorname_0=$Vendor" -List | Select-Object Path
$VST3TargetNfos = Get-ChildItem "C:\Users\futur\Documents\Image-Line\FL Studio\Presets\Plugin database\Installed\Effects\VST3" -Force -Filter *.nfo | Select-String "ps_file_vendorname_0=$Vendor" -List | Select-Object Path
$VST3TargetFsts = Get-ChildItem "C:\Users\futur\Documents\Image-Line\FL Studio\Presets\Plugin database\Installed\Effects\VST3" -Force -Filter *.fst | Select-String "ps_file_vendorname_0=$Vendor" -List | Select-Object Path


$VST2TargetNfos | ForEach-Object {

    $text = [System.IO.File]::ReadAllText($_.Path)
    $text -match 'ps_name=(.+)'
    $ps_name = $Matches[0]
    $text -match 'ps_file_name_0=(.+)'
    $ps_file_name_0 = $Matches[0]
    $text -match 'ps_presetfilename=(.+)'
    $ps_presetfilename = $Matches[0]

    Write-Host "`$ps_name:           " $ps_name -ForegroundColor Green
    Write-Host "`$ps_file_name_0:    " $ps_file_name_0 -ForegroundColor Green
    Write-Host "`$ps_presetfilename: " $ps_presetfilename -ForegroundColor Green

    break
}