import csv
import os
from collections import Counter

INPUT_CSV = "scan_results.csv"
OUTPUT_SUMMARY = "final_summary.txt"

def main():
    if not os.path.exists(INPUT_CSV):
        print("- CRITICAL: Scan results CSV not found. Skipping analysis.")
        return

    countries = []
    high_risk_count = 0
    total_ips = 0

    with open(INPUT_CSV, "r", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for row in reader:
            total_ips += 1
            
            # Count country, ensuring data exists:
            country = row.get("Country")
            if country and country not in ["N/A", "Error", "None"]:
                countries.append(country)
            
            # Count High Risk (over 50%):
            try:
                if int(row.get("Score", 0)) > 50:
                    high_risk_count += 1
            except ValueError:
                pass 

    # Determine most frequent country:
    if countries:
        most_common = Counter(countries).most_common(1)[0]
        top_country_str = f"{most_common[0]} ({most_common[1]} IPs)"
    else:
        top_country_str = "N/A - Insufficient geographical data"

    # Write summary for final report display:
    with open(OUTPUT_SUMMARY, "w") as f:
        f.write(f"Total IPs Scanned: {total_ips}\n")
        f.write(f"High Risk IPs (>50%): {high_risk_count}\n")
        f.write(f"Primary Source Country: {top_country_str}\n")
    
    print(f"- Analysis complete. Summary written to {OUTPUT_SUMMARY}")

main()