# Project Details

## Purpose & Outcome

The purpose of this group project was to assess the security of the OWASP Juice Shop, an intentionally vulnerable web application. The team solved a set of security challenges, analysed the underlying vulnerabilities against OWASP and CWE classifications, and then ran static and dynamic application security testing on the application, finishing with remediation recommendations.

The outcome was a full technical report covering challenge solutions with evidence, eight vulnerability analyses (injection, broken authentication, sensitive data exposure, improper input validation, broken access control, observability failures, cryptographic issues, and security misconfiguration), a SAST scan with Semgrep that produced 38 findings, and a DAST scan with OWASP ZAP producing 10 alert categories. The DAST work turned a low-confidence SQL injection flag into a manually validated, high-risk finding, and every analysis ended in concrete mitigations aligned with OWASP standards.

## Technologies, Tools and Methods

- OWASP Juice Shop as the target application
- Burp Suite: intercept, repeater, and intruder (Sniper attacks)
- Browser developer tools for client-side code analysis
- SAST with Semgrep using the OWASP Top Ten ruleset
- DAST with OWASP ZAP: traditional and AJAX spiders, targeted active scans
- Manual validation of scanner findings to eliminate false positives
- Vulnerability taxonomy: OWASP Top 10 and CWE classifications
- Techniques: SQL injection, API request manipulation, null byte injection, encoding-based coupon forgery analysis
- Remediation guidance aligned with OWASP ASVS and proactive controls

## Individual Contribution

This was a four-person group project. I solved seven Juice Shop challenges, including Password Hash Leak (API manipulation to expose a password field), Deluxe Fraud (modifying transaction parameters), Product Tampering (an unauthorised PUT request to modify product data), and Misplaced Signature File (double-encoded null byte injection to access restricted files). I authored two full vulnerability analyses: Broken Access Control and Observability Failures, each with root cause, exploit walkthrough, impact, and mitigations. I also performed the analysis of two Semgrep SAST findings (server-side code injection through eval, and a hardcoded RSA private key) and wrote several DAST analyses, including the manual validation that confirmed the SQL injection vulnerability and the reviews of the CSP, CORS, clickjacking, and session ID findings.