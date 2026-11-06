# Project Details

## Purpose & Outcome

This was a group project comparing three open-source firewalls: OPNsense, Smoothwall, and VyOS. The goal was to configure each firewall in a virtualised lab network, enforce a desired network behaviour, and test how each one handled five attack types: reconnaissance, port scanning, vulnerability scanning, brute-force attacks, and denial-of-service.

The lab consisted of five virtual machines across a WAN and LAN network: an attacker PC running Kali Linux, an admin PC, the firewall, an Ubuntu web server, and a home PC.

The outcome was a full comparison of all three firewalls. The key findings were that all three are secure when configured correctly, that a firewall acts as a border guard which forwards traffic once a rule explicitly permits it, and that non-default features such as rate-limiting are necessary to resist brute-force and DoS attacks.

## Technologies, Tools and Methods

- VirtualBox for the virtualised lab environment
- OPNsense, Smoothwall Express, and VyOS firewalls
- iptables rule configuration on Smoothwall
- Suricata intrusion detection with ET Open rulesets (OPNsense)
- NAT port forwarding
- Attack tools from Kali Linux: ping, nmap (host, port, and vulnerability scanning), hydra (brute force), hping3 (DoS flooding)
- Firewall log analysis to verify blocked and forwarded traffic
- Zone-based firewall configuration (VyOS)

## Individual Contribution

This was a three-person group project. I was responsible for the Smoothwall firewall. I tested its default behaviour against all five attacks, then configured it myself: I added iptables rules to its startup file to allow the admin PC full access to the LAN, I located and removed the built-in rules blocking ICMP traffic, and I added rules allowing HTTP, HTTPS, and SSH from the WAN to the web server. I then re-ran each attack against the configured firewall and analysed the Smoothwall logs to document what was blocked and what passed through. I wrote the full Smoothwall section of the report, including its conclusion, and I presented the Smoothwall part of the project presentation.