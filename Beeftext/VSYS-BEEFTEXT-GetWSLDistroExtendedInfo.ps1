$VersionData = & wsl cat /etc/*-release

# Initialize variables to hold the extracted values
$name = $null
$version = $null
$codename = $null
$idLike = $null

# Split the string into lines and iterate through each line
$VersionData -split "`n" | ForEach-Object {
    # Trim any leading or trailing whitespace
    $line = $_.Trim()

    # Extract values based on the key
    switch -Regex ($line) {
        '^NAME=' { $name = $line -replace '^NAME="?(.*?)"?$', '$1' }
        '^VERSION=' { $version = $line -replace '^VERSION="?(.*?)"?$', '$1' }
        '^VERSION_CODENAME=' { $codename = $line -replace '^VERSION_CODENAME="?(.*?)"?$', '$1' }
        '^ID_LIKE=' { $idLike = $line -replace '^ID_LIKE="?(.*?)"?$', '$1' }
    }
}

$codename = $codename.Substring(0,1).ToUpper() + $codename.Substring(1).ToLower()
$idLike = $idLike.Substring(0,1).ToUpper() + $idLike.Substring(1).ToLower()

# Format the final output
$finalOutput = @"
Name: $name
Version: $version
Codename: $codename
ID Like: $idLike
"@ 

# Output the final formatted string
$finalOutput
