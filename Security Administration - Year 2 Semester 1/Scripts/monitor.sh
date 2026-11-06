#!/bin/bash

echo "Starting Security Monitoring..."

# Check Firewall Status (UFW)
echo -e "\n Host Firewall Status (UFW):"
if sudo ufw status | grep -q "Status: active"; then
    echo "UFW is active and running."
    sudo ufw status | grep -v "Status: active"
else
    echo "ALERT: UFW is INACTIVE."
fi

# Check SSH Brute-Force Protection (Fail2Ban)
echo -e "\n Brute-Force Protection Status (Fail2Ban):"
if sudo systemctl status fail2ban | grep -q "active (running)"; then
    echo "Fail2Ban service is running."
    sudo fail2ban-client status sshd | grep "Currently banned"
else
    echo "ALERT: Fail2Ban is NOT running."
fi

# Check Recent Failed Login Attempts
echo -e "\n Recent Failed Login Attemps:"
sudo grep "Failed password for" /var/log/auth.log | tail -n 5
if [ $? -ne 0 ]; then
    echo "No failed login attempts found."
fi

# Check Root Processes
echo -e "\n Processes Running as Root:"
ps -eo user,pid,pcpu,pmem,command --sort=-pcpu | head -n 10

echo "Monitoring complete."