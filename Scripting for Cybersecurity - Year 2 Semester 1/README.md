# Automated Threat Intelligence Auditor

An automated cybersecurity workflow that takes a list of suspicious IP addresses, enriches them using the AbuseIPDB API, and produces a structured analysis report. It combines PowerShell and Python to simulate a real-world SOC investigation workflow.

## File Structure

```
Master_Run.ps1        Orchestrates the whole pipeline
1_LogExtractor.ps1   Produces the list of suspicious IPs
2_ApiScanner.py       Queries AbuseIPDB and saves the results to CSV
3_StatsCruncher.py   Computes the statistics
4_ReportViewer.ps1    Prints the colour-coded report
ip_list.txt           Extracted IP addresses
scan_results.csv      AbuseIPDB scan results
final_summary.txt     Statistical summary
README.md
```

## Requirements

Windows PowerShell 5.1 or PowerShell 7+:

```
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Python 3.9+:

```
pip install requests
```

Administrator privileges are needed to run the full pipeline.

## API Configuration

Set your AbuseIPDB API key as an environment variable:

```
$env:ABUSEIPDB_API_KEY="YOUR_API_KEY_HERE"
```

## Usage

Run the full workflow:

```
.\Master_Run.ps1
```

Or run the components individually:

```
.\1_LogExtractor.ps1
python 2_ApiScanner.py
python 3_StatsCruncher.py
.\4_ReportViewer.ps1
```

## Output Files

- `ip_list.txt` - extracted IP addresses
- `scan_results.csv` - AbuseIPDB scan results
- `final_summary.txt` - statistical summary

## Educational Purpose

This project was created for educational purposes only. It is a coursework project published to demonstrate learning. The IP list used for the demonstration is hardcoded and the tool is intended for authorised analysis workflows only.