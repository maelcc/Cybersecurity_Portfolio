# Project Details

## Purpose & Outcome

The purpose of this group project was to build an automated threat intelligence auditor: a tool that takes a list of suspicious IP addresses, enriches them with data from the AbuseIPDB API, statistically analyses the results, and presents a colour-coded audit report. The tool simulates a real SOC investigation workflow, where manually checking IPs against threat databases is slow and repetitive.

The tool is a multi-stage pipeline orchestrated by a master script: a log extractor produces the IP list, an API scanner collects abuse confidence scores, country codes, and ISP data, a stat cruncher computes the key statistics, and a report viewer prints the findings with colour coding for risk level.

The outcome was a fully working, easy-to-use pipeline that runs every stage in one command and reduces the mean time to detect by automating the lookup process. The original design targeted Windows Event ID 4625 (failed logons) as its source of suspicious IPs; when the host environment blocked access to the security event logs, we switched to a guaranteed IP list to demonstrate the full pipeline.

## Technologies, Tools and Methods

- PowerShell for system automation, orchestration, and reporting
- Python for API interaction and data analysis
- AbuseIPDB API for IP enrichment, with the API key read from an environment variable
- The Python requests library
- File-based intermediaries between stages (txt, csv)
- Administrator privilege checks and error handling
- Colour-coded console output for risk levels
- Threat intelligence concepts: Indicators of Compromise, Event ID 4625, abuse confidence scoring

## Individual Contribution

This was a two-person group project. I wrote both Python scripts: the API scanner that queries AbuseIPDB for each IP and writes the results to CSV, and the stat cruncher that computes the total and high-risk IP counts and the primary source country. I also wrote the master PowerShell script that orchestrates the whole pipeline, and I authored the Introduction and Cybersecurity Context sections of the report. We reviewed each other's work throughout the project.