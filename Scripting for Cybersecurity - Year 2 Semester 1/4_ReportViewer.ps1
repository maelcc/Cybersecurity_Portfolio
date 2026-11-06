param (
    [string]$InputFile = "final_summary.txt"
)

if (-not (Test-Path $InputFile)) {
    Write-Host "- ERROR: Summary file not found. Analysis failed or was skipped."  -ForegroundColor Red
    exit 1
}

# Read summary file line by line:
$summary = Get-Content $InputFile

Write-Host "`nIP Reputation Audit Report:"

foreach ($line in $summary) {
    # Conditional Formatting for High Risk:
    if ($line -match "High Risk IPs") {
        # Extract the count for High Risk IPs:
        $count = $line -replace '\D+(\d+)\D+', '$1' | Out-String | % { $_.Trim() }
        
        # Colour code based on the count:
        if ([int]$count -gt 0) {
            Write-Host "- $line" -ForegroundColor Red
        }
        else {
            Write-Host "- $line" -ForegroundColor DarkGreen
        }
    }
    # Conditional Formatting for Total IPs Scanned:
    elseif ($line -match "Total IPs Scanned") {
        Write-Host "- $line" -ForegroundColor Cyan
    }
    # Conditional Formatting for Primary Source Country:
    elseif ($line -match "Primary Source Country") {
        Write-Host "- $line" -ForegroundColor Yellow
    }
    else {
        # Default printing for all other lines:
        Write-Host "- $line"
    }
}

Write-Host "Audit Complete."