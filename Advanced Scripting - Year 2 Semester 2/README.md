# PowerShell Log Analysis Tool

A PowerShell tool that scans log files and detects suspicious activity. It analyses three types of logs: a web server access log, an SSH authentication log, and a PowerShell log. After scanning, it generates an investigation report summarising all findings.

## Features

- Detects repeated 404 'Not Found' errors, which can indicate an attacker mapping a site structure
- Detects repeated 403 'Forbidden' errors, which can indicate attempts to access restricted content
- Detects repeated failed SSH passwords, which can indicate a brute-force attack
- Detects failed login attempts as admin or root
- Detects suspicious PowerShell patterns such as '-EncodedCommand', '-ExecutionPolicy Bypass', 'Invoke-WebRequest' and 'DownloadString'
- Detects potential data exfiltration, combining archive creation with an upload command
- Matches log entries against a list of known Indicators of Compromise (malicious IPs and web paths)
- Generates an investigation report with all alerts and hit counts

## Project Structure

- `scripts/configuration.ps1` holds all essential variables: log and report file locations, alert and hit counters, and detection thresholds
- `scripts/detection_functions.ps1` contains the 7 detection functions
- `scripts/report_generator.ps1` creates, displays, and saves the report
- `run.ps1` runs all the functions and the report generator

## Usage

Run the main script from PowerShell:

```
.\run.ps1
```

The tool can also be run from any location using the full path to the script. Adjust the detection thresholds in `scripts/configuration.ps1` if needed.

## Educational Purpose

This project was created for educational purposes only. It is a coursework project published to demonstrate learning. It is intended for use on log files in controlled, authorised environments only and must not be used against systems without the explicit permission of their owners.