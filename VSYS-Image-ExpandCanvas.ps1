param (
    [Parameter(Mandatory=$false, Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

$Files = Get-Content $FileList

$Files | ForEach-Object -Parallel {

    $Image = $_

    $Dimensions = Get-ImageDimensions -ImagePath $Image
    Write-Host "`$Dimensions.Width: " $Dimensions.Width -ForegroundColor Green
    Write-Host "`$Dimensions.Height:" $Dimensions.Height -ForegroundColor Green

    # $cmd = Get-Command identify.exe
    # [System.String]$Results = & $cmd $Image
    # $Dimensions = ($Results.Split(' '))[2]
    # $Width = ($Dimensions.Split('x'))[0]
    # $Height = ($Dimensions.Split('x'))[1]


} -ThrottleLimit $MaxThreads