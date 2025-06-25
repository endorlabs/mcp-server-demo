---
description: "Run SAST scan using Endor Labs via MCP server integration on source code changes"
applyTo: '**/*.c, **/*.cpp, **/*.cc, **/*.cs, **/*.go, **/*.java, **/*.js, **/*.jsx, **/*.ts, **/*.tsx, **/*.py, **/*.php, **/*.rb, **/*.rs, **/*.kt, **/*.kts, **/*.scala, **/*.swift, **/*.dart, **/*.html, **/*.yaml, **/*.yml, **/*.json, **/*.xml, **/*.sh, **/*.bash, **/*.clj, **/*.cljs, **/*.ex, **/*.exs, **/*.lua'
---
# Static Application Security Testing (SAST) Rule (Endor Labs via MCP)
This project uses [Endor Labs](https://docs.endorlabs.com/) for automated SAST scanning, integrated through the MCP server as configured in `.vscode/mcp.json`.
## Workflow
Whenever a supported source code file is modified:
1. Ensure Semgrep is installed and available at version 1.99.0.
   - If Semgrep is not installed or the version is incorrect, prompt the user to install it.
   - Do not proceed with the scan unless Semgrep is available and valid.
   - To install Semgrep, run: `pip install semgrep==1.99.0`
2. Run `endor-cli-tools` using the `scan` tool via the MCP server to perform a SAST scan on the modified source files.
3. If any vulnerabilities are found:
   - Present the issues to the user.
   - Recommend appropriate fixes (e.g., input sanitization, validation, escaping, secure APIs).
   - Address all critical issues and re-run the scan to confirm resolution.
## Notes
- All scans must be performed using the MCP server integration (`endor-cli-tools`) as configured in `.vscode/mcp.json`. Do not invoke `endorctl` directly.
- For troubleshooting, ensure the MCP server is running and `endorctl` is installed and accessible in your environment.
This rule ensures all code changes are automatically reviewed for common security vulnerabilities using Endor Labs and the MCP server, with Semgrep as the underlying engine.
