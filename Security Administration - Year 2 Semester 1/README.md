# Secure Cloud Deployment: TechStart Solutions

A secure cloud environment built on Azure for a fictional company, TechStart Solutions, with its web application deployed in it. The design follows the Principle of Least Privilege and Defence in Depth, with security controls layered from the network perimeter down to data encryption.

## Architecture

- An Ubuntu 24.04 virtual machine hosting a Python Flask web application, served by Apache over HTTPS
- An Azure SQL database storing staff and project data, reachable only from the web server
- Blob storage for employee profile pictures
- A virtual network with two subnets (web and database) for segmentation
- A Network Security Group blocking all traffic by default except SSH (admin only), HTTP, and HTTPS

## Security Controls

- Network segmentation and access control with NSG rules and database firewall rules
- Key-based SSH authentication only (password and root login disabled)
- Password complexity enforced with PAM
- Encryption in transit (HTTPS with a self-signed certificate, SSL-enforced database connections) and at rest (Azure transparent data encryption)
- System hardening with UFW, unattended-upgrades, Fail2Ban, and Auditd
- Logging with logrotate, plus Azure Backup for full disaster recovery
- Role-based access control with custom Azure roles per team and role-based dashboards
- Passwords hashed with bcrypt

## Repository Contents

- `app.py` - Flask web application with login and role-based dashboards
- `login.html`, `dashboard.html` - application templates
- `schema.sql` - database schema and seed data
- `harden.sh` - security hardening script (updates, UFW, open port check)
- `monitor.sh` - security monitoring script (firewall, Fail2Ban, failed logins, root processes)
- `techstart-ssl.conf` - Apache HTTPS configuration
- `app.wsgi` - WSGI entry point

## Educational Purpose

This project was created for educational purposes only. TechStart Solutions is a fictional organisation and all employee data is fictional. The environment was built in a student subscription for a coursework project and is not intended for production use.