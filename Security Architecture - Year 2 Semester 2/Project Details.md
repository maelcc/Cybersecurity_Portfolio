# Project Details

## Purpose & Outcome

The purpose of this project was to design and implement an AWS cloud solution for WinLocal Giveaways, a fictional Dublin startup suffering from downtime, vulnerabilities, and scalability problems after a ransomware incident. The project had four tasks: a detailed AWS architecture diagram, a working proof of concept, a justification of additional AWS services, and a sustainability analysis based on the AWS Well-Architected Framework.

The proof of concept was fully implemented: a virtual private cloud spanning two availability zones with three subnets each, a bastion host for controlled SSH access to the private servers, an Amazon Machine Image for repeatable deployments, a single-AZ RDS database (with its limitations documented), auto scaling between one and two instances based on a 60% CPU target, an application load balancer distributing traffic, layered security groups, and an S3 static backup website as a failover. Route 53 and a Web Application Firewall were designed and justified but not implemented in the proof of concept.

The outcome was a working, secure, and cost-conscious AWS environment demonstrating high availability, fault tolerance, and defence in depth, along with documented recommendations for the client's future sustainability and budget.

## Technologies, Tools and Methods

- AWS VPC with segmented public and private subnets across two availability zones, plus route tables
- EC2 instances (t3.micro, Amazon Linux) for the bastion host and web/app servers
- Bastion host pattern for controlled SSH access to private instances
- Amazon Machine Images for templated deployments
- Amazon RDS (MySQL) for the database layer
- Auto Scaling groups with target tracking policies and CloudWatch alarms
- Application Load Balancer for traffic distribution
- Security groups as layered, stateful firewalls
- S3 static website hosting for the backup site
- Designed services: Route 53 failover, WAF, CloudFront, KMS, Certificate Manager, AWS Config, CloudTrail
- NIST Cybersecurity Framework 2.0 (used in the group presentation)
- AWS Well-Architected Framework sustainability pillar

## Individual Contribution

The architecture diagram and the full proof of concept were individual work: I designed the diagram myself and built every part of the AWS environment myself, including the network, bastion host, AMI, database, auto scaling, load balancer, security groups, and the S3 backup website, and I wrote the report. For the group presentation (a three-person task for the same module), I was responsible for the NIST CSF 2.0 section: I mapped WinLocal's security issues to all six framework functions, wrote that part of the script and slides, and delivered the conclusion.