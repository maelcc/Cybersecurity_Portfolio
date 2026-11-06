$ScriptPath = $PSScriptRoot
Set-Location $ScriptPath

Write-Host "STARTING APPLICATION ERROR AUDITOR WORKFLOW"

# STEP 1: IP Extractor:
Write-Host "`nSTEP 1: Extracting Suspicious IPs"
& ".\1_LogExtractor.ps1"

# Check if data was written before proceeding:
if ((Test-Path "ip_list.txt") -and ((Get-Item "ip_list.txt").Length -gt 0)) {
    
    # STEP 2: API Scanner (Python):
    Write-Host "`nSTEP 2: Enriching IPs via AbuseIPDB API"
    python "2_ApiScanner.py"

    # STEP 3: Stats Cruncher (Python):
    if (Test-Path "scan_results.csv") {
        Write-Host "`nSTEP 3: Analysing Threat Data"
        python "3_StatsCruncher.py"
        
        # STEP 4: Report Viewer:
        Write-Host "`nSTEP 4: Displaying Audit Report"
        & ".\4_ReportViewer.ps1"
    }
    else {
         Write-Host "`n- ERROR: CSV not created. Report display skipped."
    }
}
else {
    Write-Host "`n- ERROR: ip_list.txt was not created or is empty. Workflow cannot proceed."
}

Write-Host "`nWorkflow Complete."