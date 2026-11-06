# Open-Source Firewall Comparison

A group project comparing three open-source firewalls: OPNsense, Smoothwall, and VyOS. Each firewall was configured in an isolated virtual lab and tested against five attack types to see how well it enforced a desired network behaviour.

## Lab Setup

Five virtual machines in VirtualBox across two networks:

- WAN: an attacker PC (Kali Linux) and an admin PC
- LAN: an Ubuntu web server and a home PC
- The firewall routing traffic between WAN and LAN

Desired behaviour: the web server serves its page to both networks, SSH to the web server is only allowed from the admin PC, and outbound traffic from the web server and home PC is allowed.

## Attacks Tested

1. Reconnaissance (active and passive)
2. Port scanning (SYN, connect, UDP, and stealth scans)
3. Vulnerability scanning (Nmap Scripting Engine)
4. Brute-force attacks (hydra)
5. Denial-of-service (hping3 SYN flood)

## Key Findings

- Smoothwall's default configuration blocks all inbound WAN traffic with no custom rules
- Once a rule explicitly permits traffic, the firewall simply forwards it: it is a border guard, not a vulnerability patcher
- Suricata on OPNsense detected Nmap scans when the right rulesets were enabled
- Rate-limiting and similar non-default features are necessary to resist DoS attacks
- All three firewalls are secure when configured correctly, but their usability varies significantly

## My Contribution

In this group project I was responsible for the Smoothwall firewall: default behaviour testing, iptables rule configuration, attack execution, and log analysis.

## Educational Purpose

This project was created for educational purposes only. All attacks were performed in an isolated, virtualised lab environment against systems built for this project. The techniques documented here must not be used against any system or network without the explicit permission of its owner.