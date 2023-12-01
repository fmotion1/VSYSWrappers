param (
    [Parameter(Mandatory, Position = 0)]
    [String]
    $FileList,

    [Parameter(Mandatory=$false)]
    [Int32]
    $MaxThreads = 16
)

begin {
    & "D:\Dev\Python\00 VENV\FontTools\Scripts\Activate.ps1"
}

process{

    $OokiiSplat = @{
        MainInstruction = "Please specify the conversion tolerance (0.0-3.0)"
        MainContent     = "Low tolerance adds more points but keeps shapes. High tolerance adds few points but may change shape."
        WindowTitle     = "FontFoundryTools TTF2OTF"
        InputText       = 1
    }

    while($true){
        $Result = Invoke-OokiiInputDialog @OokiiSplat
        if($Result[1] -eq 'Cancel'){
            exit 2
        }
        [float]$DecimalValue = $Result[0]
        if ($DecimalValue -ge 0.0 -and $DecimalValue -le 3.0) {
            break
        }
    }

    $Files = Get-Content $FileList
    $Files | ForEach-Object -Parallel {

        $File = $_
        $cmd = Get-Command "D:\Dev\Python\00 VENV\FontTools\Scripts\ftcli.exe"
        & $cmd converter ttf2otf -t $Using:DecimalValue --no-overwrite $File

    } -ThrottleLimit $MaxThreads

    Remove-Item $FileList -Force
}
