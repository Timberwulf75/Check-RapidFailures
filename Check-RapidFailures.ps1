# PowerShell Script to Detect Rapid Logon Failures

# Retrieve all Event ID 4625 logs from the Security log
$events = Get-WinEvent -FilterHashtable @{LogName='Security'; Id=4625} | 
          Select-Object -Property TimeCreated, @{Name="AccountName";Expression={$_.Properties[5].Value}}

# Group events by AccountName to analyze failures per user
$groupedEvents = $events | Group-Object -Property AccountName

# Initialize an array to store results
$rapidFailureResults = @()

# Define the threshold for what is considered rapid succession
$timeThresholdSeconds = 10
$minimumRapidFailures = 5

# Analyze each user account group for rapid succession failures
foreach ($group in $groupedEvents) {
    $accountName = $group.Name
    $timestamps = $group.Group | Select-Object -ExpandProperty TimeCreated
    $rapidFailures = 0

    for ($i = 0; $i -lt $timestamps.Count - 1; $i++) {
        $timeDiff = $timestamps[$i+1] - $timestamps[$i]
        if ($timeDiff.TotalSeconds -lt $timeThresholdSeconds) { # Check if less than defined threshold between failures
            $rapidFailures++
        }
    }

    # If the number of rapid failures exceeds the defined minimum, add it to the results
    if ($rapidFailures -ge $minimumRapidFailures) {
        $rapidFailureResults += [PSCustomObject]@{
            UserName       = $accountName
            RapidFailures  = $rapidFailures
            TotalFailures  = $group.Count
        }
    }
}

# Display results
if ($rapidFailureResults.Count -gt 0) {
    Write-Output "Accounts with rapid logon failures:"
    $rapidFailureResults | Format-Table -AutoSize
} else {
    Write-Output "No accounts found with rapid logon failures within the defined threshold."
}
