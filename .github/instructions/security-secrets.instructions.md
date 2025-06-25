---
description: "Scan for leaked secrets on file modification using Endor Labs via MCP server integration"
applyTo: '**/*'
---
# Leaked Secrets Detection Rule (Endor Labs via MCP)
This project uses [Endor Labs](https://docs.endorlabs.com/) for automated security scanning, integrated through the MCP server as configured in `.vscode/mcp.json`.
## Workflow
Whenever a file is modified in the repository:
- Run `endor-cli-tools` using the `scan` tool via the MCP server to check for leaked secrets.
- Ensure the scan includes all file types and respects `.gitignore` unless otherwise configured.
- If any secrets are detected:
  - Remove the exposed secret immediately.
  - Re-run the scan to verify the secret has been properly removed.
- Save scan results and remediation steps in a security log or as comments for audit purposes.
## Notes
- All scans must be performed using the MCP server integration (`endor-cli-tools`) as configured in `.vscode/mcp.json`. Do not invoke `endorctl` directly.
- For troubleshooting, ensure the MCP server is running and `endorctl` is installed and accessible in your environment.
This rule ensures no accidental credentials, tokens, API keys, or secrets are committed or remain in the project history.