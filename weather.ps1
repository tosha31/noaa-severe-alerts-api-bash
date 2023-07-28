
# Define the API endpoint URL
$apiUrl = "https://api.weather.gov/alerts"

# Set the location to St. Louis, MO **Don't forget to change this to your personal location! 
$location = "St. Louis,MO"

# Create the request URL with the location parameter
$requestUrl = "https://api.weather.gov/alerts?point=38.627,-90.199"

# Make the API request
$response = Invoke-RestMethod -Uri $requestUrl -Method Get

# Extract the severe weather alerts from the response
$severeWeatherAlerts = $response.features

# Display the severe weather alerts
Write-Host "Severe Weather Alerts for " + $location + ":"
foreach ($alert in $severeWeatherAlerts) {
    Write-Host "------------------"
    Write-Host "Event: $($alert.properties.event)"
    Write-Host "Severity: $($alert.properties.severity)"
    Write-Host "Description: $($alert.properties.description)"
    Write-Host "------------------"
}

