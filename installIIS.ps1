# installIIS.ps1

# Install Web-Server role
Install-WindowsFeature -name Web-Server -IncludeManagementTools

# Retrieve the computer name
$computerName = $env:COMPUTERNAME

# Creating a default.html file in the IIS root folder
$defaultPageContent = @"
<html>
<head>
    <title>Welcome to $computerName</title>
</head>
<body>
    <h1>Hello, World!</h1>
    <p>This is the server named $computerName</p>
</body>
</html>
"@

# Wait for the inetpub\wwwroot folder to be available
$wwwrootPath = "C:\inetpub\wwwroot"
$maxRetries = 10
$retryCount = 0
$waitSeconds = 5
while ((-Not (Test-Path -Path $wwwrootPath)) -and ($retryCount -lt $maxRetries)) {
    Write-Output "Waiting for $wwwrootPath to be available..."
    Start-Sleep -Seconds $waitSeconds
    $retryCount++
}

if (-Not (Test-Path -Path $wwwrootPath)) {
    Write-Error "Failed to find $wwwrootPath after waiting for $(($maxRetries * $waitSeconds)) seconds."
    exit 1
}

# Write the HTML content to the default.html file
$defaultPagePath = Join-Path $wwwrootPath "default.html"
Set-Content -Path $defaultPagePath -Value $defaultPageContent

Write-Output "Default page created at $defaultPagePath"
