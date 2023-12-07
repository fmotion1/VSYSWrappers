param (
    [Parameter(Mandatory,Position=0)]
    [String[]]
    $FileList
)

$Path = Get-Content $FileList

$Path | ForEach-Object {

    $originalFolder = $_

    if(!(Test-Path -LiteralPath "$originalFolder\Drum Singles" -PathType Container)){
        [IO.Directory]::CreateDirectory("$originalFolder\Drum Singles")
        #New-Item -ItemType Directory -Path "$originalFolder\Drum Singles"
    }

    if(!(Test-Path -LiteralPath "$originalFolder\Drum Loops" -PathType Container)){
        [IO.Directory]::CreateDirectory("$originalFolder\Drum Loops")
        #New-Item -ItemType Directory -Path "$originalFolder\Drum Loops"
    }

    if(!(Test-Path -LiteralPath "$originalFolder\Tonal Singles" -PathType Container)){
        [IO.Directory]::CreateDirectory("$originalFolder\Tonal Singles")
        #New-Item -ItemType Directory -Path "$originalFolder\Tonal Singles"
    }

    if(!(Test-Path -LiteralPath "$originalFolder\Tonal Loops" -PathType Container)){
        [IO.Directory]::CreateDirectory("$originalFolder\Tonal Loops")
        #New-Item -ItemType Directory -Path "$originalFolder\Tonal Loops"
    }

    if(!(Test-Path -LiteralPath "$originalFolder\FX Singles" -PathType Container)){
        [IO.Directory]::CreateDirectory("$originalFolder\FX Singles")
        #New-Item -ItemType Directory -Path "$originalFolder\FX Singles"
    }

    if(!(Test-Path -LiteralPath "$originalFolder\FX Loops" -PathType Container)){
        [IO.Directory]::CreateDirectory("$originalFolder\FX Loops")
        #New-Item -ItemType Directory -Path "$originalFolder\FX Loops"
    }
}

Remove-Item $FileList -Force

Start-Sleep -Milliseconds 10
$wshell = New-Object -ComObject wscript.shell;
$wshell.SendKeys("{F5}")
Start-Sleep -Milliseconds 30
$wshell.SendKeys("{F5}")