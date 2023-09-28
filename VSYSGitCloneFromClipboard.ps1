param (
    [Parameter(Mandatory,Position=0)]
    [String]$Directory
)


function isURI($address) {
	($address -as [System.URI]).AbsoluteURI -ne $null
}

function isURIWeb($address) {
	$uri = $address -as [System.URI]
	$uri.AbsoluteURI -ne $null -and $uri.Scheme -match '[http|https]'
}


$URL = Get-Clipboard -Raw



if( (isURI($URL)) -and (isURIWeb($URL)) ){
    Set-Location -Path $Directory
    & git clone $URL
}else{
    Invoke-OokiiTaskDialog -MainInstruction "Invalid Repo URL" -MainContent "The repo $URL is invalid and cannot be cloned."
    exit
}
