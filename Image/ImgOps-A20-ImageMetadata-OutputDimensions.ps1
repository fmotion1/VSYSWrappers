param (
    [Parameter(Mandatory,Position=0)]
    [String]
    $FileList
)

$Files = Get-Content $FileList

$Files | ForEach-Object {
    # $Dimensions = identify -format "%wx%h," $_
    # $AllDimensions = $Dimensions.Split(",")
    # $AllDimensions = $AllDimensions | Sort-Object -Descending
    # $AllDimensions
    identify $_
}

