# OWASP Juice Shop Security Assessment

A security assessment of the OWASP Juice Shop, an intentionally vulnerable web application. This group project covered challenge solving, vulnerability analysis, and both static and dynamic application security testing, with remediation recommendations for every finding.

## What Was Done

- Solved a range of Juice Shop challenges exploiting real vulnerability classes
- Wrote vulnerability analyses covering injection, broken authentication, sensitive data exposure, input validation, broken access control, observability failures, cryptographic issues, and security misconfiguration
- Ran SAST with Semgrep (OWASP Top Ten ruleset), producing 38 findings, and analysed key results including a critical SQL injection sink and a hardcoded RSA private key
- Ran DAST with OWASP ZAP using both spiders and targeted active scans, producing 10 alert categories
- Manually validated scanner findings, confirming a high-risk SQL injection in the product search endpoint

## Tools

- Burp Suite (intercept, repeater, intruder)
- Semgrep (SAST)
- OWASP ZAP (DAST)
- Browser developer tools

## Key Findings

- SQL injection in the product search endpoint, confirmed manually
- Server-side code injection through eval in the user profile feature
- Hardcoded RSA private key in the source code, breaking JWT integrity
- Missing security headers (CSP, X-Frame-Options), wildcard CORS, and session IDs in URLs
- Client-side validation (file size limits, coupons) that fails without server-side enforcement

## Educational Purpose

This project was created for educational purposes only. The OWASP Juice Shop is an intentionally vulnerable application designed for security training, and all testing was performed against a local instance. The techniques documented here must only be used against systems you are authorised to test.