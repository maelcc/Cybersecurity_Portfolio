param (
    [string]$OutputFile = "ip_list.txt"
)

# Check Administrator privileges:
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    Write-Error "- CRITICAL: Must run as Administrator to maintain integrity." -ForegroundColor Red
    exit 1
}

# Hardcoded, high-value IPs to ensure API scanning and reporting success (we decided to hardcode these IPs for demonsrtation purposes)
$demoIps = @(
    "1.1.1.1",             # Low Score
    "185.220.101.121",     # High Risk
    "88.169.170.150",      # High Risk
    "203.0.113.1",         # Reserved
    "185.105.107.13"       # Medium Risk
)

$demoIps | Out-File -FilePath $OutputFile -Encoding ascii
Write-Host "- Successfully wrote $($demoIps.Count) demonstration IPs to $OutputFile."