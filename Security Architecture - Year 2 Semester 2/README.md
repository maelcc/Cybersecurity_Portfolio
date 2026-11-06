# AWS Cloud Solution for WinLocal Giveaways

A cloud architecture design and working proof of concept built on AWS for WinLocal Giveaways, a fictional Dublin startup facing downtime, scalability issues, and security vulnerabilities after a ransomware incident. The goal: a highly available, fault-tolerant, and secure infrastructure at a low cost.

## Architecture

- A VPC spanning two availability zones, with three subnets per zone (public, private web/app, private database)
- A bastion host in the public subnet as the only SSH entry point to the private web/app servers
- An application load balancer distributing traffic across the web/app servers
- An auto scaling group keeping CPU utilisation at 60%, scaling between one and two instances
- A single-AZ Amazon RDS database (multi-AZ recommended for production)
- An S3 static backup website as a failover page during outages
- Layered security groups isolating the load balancer, web/app, bastion, and database layers

## Designed But Not Implemented in the PoC

- Route 53 for DNS-based failover to the static backup website
- Web Application Firewall to protect against application-layer attacks
- CloudFront, KMS, Certificate Manager, AWS Config, CloudWatch, and CloudTrail

## Sustainability

The design follows the AWS Well-Architected Framework sustainability pillar: auto scaling reduces idle resources, and further recommendations include spot and reserved instances, Graviton-based instances, and auto-shutdown schedules for non-production environments.

## Educational Purpose

This project was created for educational purposes only. WinLocal Giveaways is a fictional company and all data used in the proof of concept is fictional. The environment was built in a student AWS environment and is not intended for production use.