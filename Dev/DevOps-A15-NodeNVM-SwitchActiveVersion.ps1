param (
    [Parameter(Mandatory,Position = 0)]
    [string]$Version
)

& nvm use $Version