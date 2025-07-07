---
description: "Static Application Security Testing (SAST) using Endor Labs via MCP server integration"
applyTo: '**/*.c, **/*.cpp, **/*.cc, **/*.cs, **/*.go, **/*.java, **/*.js, **/*.jsx, **/*.ts, **/*.tsx, **/*.py, **/*.php, **/*.rb, **/*.rs, **/*.kt, **/*.kts, **/*.scala, **/*.swift, **/*.dart, **/*.html, **/*.yaml, **/*.yml, **/*.json, **/*.xml, **/*.sh, **/*.bash, **/*.clj, **/*.cljs, **/*.ex, **/*.exs, **/*.lua' 
---

# Static Application Security Testing (SAST) Rule (Endor Labs via MCP)

This project uses [Endor Labs](https://docs.endorlabs.com/) for automated SAST, integrated through the MCP server as configured in `.vscode/mcp.json`.

## Workflow

Whenever a file is modified in the repository, and before the end of an agent session perform the following workflow:

- Ensure Semgrep is installed and available at version 1.99.0.
  - If Semgrep is not installed or the version is incorrect, prompt the user to install it.
  - Do not proceed with the scan unless Semgrep is available and valid.
  - To install Semgrep, the user must have a working Python environment with pip. Recommend installing version 1.99.0.
  - Do not attempt to scan with semgrep directly.
- Run `endor-cli-tools` using the `scan` tool via the MCP server to perform SAST scans as described above.
- If any vulnerabilities or errors are found:
  - Present the issues to the user.
  - The AI agent must attempt to automatically correct all errors and vulnerabilities, including code errors, security issues, and best practice violations, before session completion.
  - Recommend and apply appropriate fixes (e.g., input sanitization, validation, escaping, secure APIs).
  - Continue scanning and correcting until all critical issues have been resolved or no further automated remediation is possible.
- If an error occurs in any MCP server tool call (such as missing required parameters like version, invalid arguments, or tool invocation failures):
  - The AI agent must review the error, determine the cause, and automatically correct the tool call or input parameters.
  - Re-attempt the tool call with the corrected parameters.
  - Continue this process until the tool call succeeds or it is determined that remediation is not possible, in which case the issue and reason must be reported.
- Save scan results and remediation steps in a security log or as comments for audit purposes.

## Notes
- All scans must be performed using the MCP server integration (`endor-cli-tools`) as configured in `.vscode/mcp.json`. Do not invoke `endorctl` directly.
- For troubleshooting, ensure the MCP server is running and `endorctl` is installed and accessible in your environment.
- Do not invoke semgrep directly.
- **Important**: This scan must use the path of the directory from which the changed files are in. Do not attempt to set the path directly to a file as it must be a directory. 

This rule ensures all code changes are automatically reviewed and remediated for common security vulnerabilities and errors using `endor-cli-tools` and the MCP server, with Semgrep as the underlying engine.
