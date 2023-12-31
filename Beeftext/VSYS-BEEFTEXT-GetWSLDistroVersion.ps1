$VersionData = & wsl cat /etc/*-release

$name = $null
$version = $null

# Split the string into lines and iterate through each line
$VersionData -split "`n" | ForEach-Object {
    # Trim any leading or trailing whitespace
    $line = $_.Trim()
    
    # Check if the line contains the NAME key
    if ($line.StartsWith("NAME=")) {
        # Extract and store the NAME value
        $name = $line.Substring(5).Trim('"')
    }
    # Check if the line contains the VERSION key
    elseif ($line.StartsWith("VERSION=")) {
        # Extract and store the VERSION value
        $version = $line.Substring(8).Trim('"')
    }
}

# Combine the NAME and VERSION values
$finalOutput = "$name $version"

# Output the final string
$finalOutput

