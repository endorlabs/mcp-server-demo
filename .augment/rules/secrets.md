---
type: "always_apply"
---

# Leaked Secrets Detection Rule (Endor Labs via MCP)
This project uses @Endor Labs for automated security scanning, integrated through the MCP server as configured as `endor-cli-tools`

## Workflow
Whenever a file is modified in the repository, and before the end of an agent session:
- Run `endor-cli-tools` using the `scan` tool via the MCP server to check for leaked secrets.
- Ensure the scan includes all file types and respects `.gitignore` unless otherwise configured.
- If any secrets or errors are detected:
  - Remove the exposed secret or correct the error immediately.
  - The AI agent must attempt to automatically correct all detected secrets and errors before session completion.
  - Re-run the scan to verify the secret or error has been properly removed or resolved.
- If an error occurs in any MCP server tool call (such as missing required parameters like version, invalid arguments, or tool invocation failures):
  - The AI agent must review the error, determine the cause, and automatically correct the tool call or input parameters.
  - Re-attempt the tool call with the corrected parameters.
  - Continue this process until the tool call succeeds or it is determined that remediation is not possible, in which case the issue and reason must be reported.
- Save scan results and remediation steps in a security log or as comments for audit purposes.

## Notes
- All scans must be performed using the MCP server integration (`endor-cli-tools`) as configured in `.cursor/mcp.json`. Do not invoke `endorctl` directly.
- For troubleshooting, ensure the MCP server is running and `endorctl` is installed and accessible in your environment.
- **Important**: This scan must use the path of the directory from which the changed files are in. Do not attempt to set the path directly to a file as it must be a directory. Use absolute paths like /Users/username/mcp-server-demo/backend rather than relative paths like 'backend'

This rule ensures no accidental credentials, tokens, API keys, or secrets are committed or remain in the project history. The scan may be performed at the end of an agent session, provided all modifications are checked and remediated before session completion.
