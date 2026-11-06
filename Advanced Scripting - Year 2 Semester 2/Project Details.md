# Project Details

## Purpose & Outcome

The purpose of this project was to build a PowerShell tool that detects suspicious activity by scanning log files. The tool analyses three log files: a web server access log, an SSH authentication log, and a PowerShell log.

It performs 9 detections in total: repeated 404 'Not Found' errors, repeated 403 'Forbidden' errors, repeated failed SSH passwords, failed login attempts as admin or root, suspicious PowerShell execution patterns, potential data exfiltration, and matches against a file of known Indicators of Compromise (malicious IPs and web paths).

The outcome was a fully working tool that scans all three log files, alerts the user when detection thresholds are exceeded, and automatically generates an investigation report summarising the alerts and the number of hits found in each file.

## Technologies, Tools and Methods

- PowerShell scripting
- 'Select-String' for pattern searching in log files
- 'foreach' loops and 'Select-Object' for iterating through and limiting results
- Threshold-based detection logic with configurable alert and hit counters
- Indicators of Compromise (IoC) matching against a list of known malicious IPs and web paths
- Modular script design, split into configuration, detection functions, report generation, and a main runner script

## Individual Contribution

I designed and built the entire tool by myself. This includes the configuration file with all thresholds and variables, the 7 detection functions, the report generator, and the main script that runs the full analysis. I chose which suspicious patterns to detect and what thresholds to set for each one, I tested the tool with the log files, and I wrote the project documentation.