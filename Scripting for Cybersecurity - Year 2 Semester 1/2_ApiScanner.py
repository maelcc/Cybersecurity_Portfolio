import os
import requests
import csv
import sys

# Configuration:
ABUSEIPDB_API_KEY = os.getenv('ABUSEIPDB_API_KEY') 
API_URL = "https://api.abuseipdb.com/api/v2/check"
INPUT_FILE = "ip_list.txt"
OUTPUT_CSV = "scan_results.csv"

def check_ip(ip_address):
    """Queries the AbuseIPDB API and returns a dictionary matching the CSV structure."""
    
    # Key Check:
    if not ABUSEIPDB_API_KEY:
        print("- CRITICAL: ABUSEIPDB_KEY environment variable not set.")
        # Return a safe error dictionary for the CSV:
        return {"IP": ip_address, "Score": -1, "Country": "KEY_ERROR", "ISP": "KEY_ERROR", "TotalReports": 0}

    headers = {
        "Key": ABUSEIPDB_API_KEY,
    }
    querystring = {
        "ipAddress": ip_address,
        "maxAgeInDays": "90"
        # Removed "verbose": "" as it is often not needed and simplifies the output
    }
    
    try:
        response = requests.get(
            url = API_URL,
            headers = headers,
            params = querystring,
            timeout = 10
        )
        
        # Check for Unauthorized errors (401):
        if response.status_code == 401:
            print(f"- Error querying {ip_address}: 401 Unauthorized. CHECK YOUR API KEY.")
            return {"IP": ip_address, "Score": -1, "Country": "UNAUTHORIZED", "ISP": "UNAUTHORIZED", "TotalReports": 0}

        response.raise_for_status() # Raise an exception for other bad status codes (like 404, 500)
        
        data = response.json().get('data', {})
        
        # Return data in the required CSV structure:
        return {
            "IP": ip_address,
            "Score": data.get("abuseConfidenceScore", 0),
            "Country": data.get("countryCode", "N/A"),
            "ISP": data.get("isp", "N/A"),
            "TotalReports": data.get("totalReports", 0)
        }
        
    except requests.exceptions.RequestException as e:
        print(f"- Network error querying {ip_address}: {e}")
        return {"IP": ip_address, "Score": -1, "Country": "NETWORK_ERROR", "ISP": "NETWORK_ERROR", "TotalReports": 0}

# Main Execution:
if not os.path.exists(INPUT_FILE):
    print(f"- ERROR: Input file {INPUT_FILE} not found. Exiting.")
    sys.exit(1)

ip_addresses = []
with open(INPUT_FILE, "r") as f:
    ip_addresses = [line.strip() for line in f if line.strip()]

all_results = []
for ip in ip_addresses:
    result = check_ip(ip)
    if result:
        all_results.append(result)
    
# Write results to CSV:
fieldnames = ["IP", "Score", "Country", "ISP", "TotalReports"]
try:
    with open(OUTPUT_CSV, 'w', newline='') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(all_results)
    print(f"- Scan complete. Wrote {len(all_results)} records to {OUTPUT_CSV}")
except Exception as e:
    print(f"- ERROR: Failed to write CSV file: {e}")
