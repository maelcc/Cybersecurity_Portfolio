# Project Details

## Purpose & Outcome

The purpose of this project was to design and build a secure cloud environment on Azure for a fictional company, TechStart Solutions, and deploy its web application in it. The environment had to satisfy five mandatory security requirements: network segmentation and access control, strong authentication and access management, encryption in transit and at rest, system hardening and monitoring, and logging, backup, and audit trail.

The outcome was a fully deployed, working web application running on an Ubuntu virtual machine with Apache serving it over HTTPS, backed by an Azure SQL database and Blob storage, all inside a segmented virtual network. The design followed the Principle of Least Privilege and Defence in Depth: employees only have access to what their role requires through custom Azure roles, and security controls are layered from the network perimeter down to data encryption. Passwords are hashed with bcrypt, SSH is key-based only, and the database is reachable only from the web server.

## Technologies, Tools and Methods

- Azure: Virtual Machine, SQL Database, Blob Storage, Virtual Network with segmented subnets, Network Security Group, custom RBAC roles, Azure Backup
- Ubuntu 24.04 LTS as the web server operating system
- Apache with mod_wsgi serving a Python Flask application over HTTPS (self-signed OpenSSL certificate, HTTP redirected to HTTPS)
- UFW host firewall with default-deny incoming policy
- PAM (libpam-pwquality) for password complexity rules
- Fail2Ban for SSH brute-force protection
- Auditd for file integrity monitoring
- unattended-upgrades for automatic security patching
- logrotate for log retention
- BASH scripting for security hardening and monitoring automation
- bcrypt for password hashing
- SQL database connections enforced with SSL

## Individual Contribution

This was an individual project, so I built the entire solution myself. I designed the cloud architecture and deployed every resource: the virtual network with its two subnets, the virtual machine, the SQL database, and the Blob storage. I implemented all five security requirements myself, including the NSG and firewall rules, the SSH key-only configuration, the HTTPS setup, the UFW, PAM, Fail2Ban, Auditd, unattended-upgrades, logrotate, and Azure Backup configuration. I wrote the two BASH automation scripts, developed the Flask web application with role-based dashboards, created and populated the database, defined the access control matrix with custom Azure roles, and wrote the full project report.