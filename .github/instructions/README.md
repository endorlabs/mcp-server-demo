# Agent Instructions Aggregation

Agents working in this repository must aggregate and follow all security and workflow instructions found in `.github/instructions/*.md` that match the current workspace and file globs. This includes, but is not limited to:

- Leaked secrets detection
- Dependency vulnerability scanning (SCA)
- Static Application Security Testing (SAST)

**Do not skip or ignore any relevant instruction file.**

If a required scan or check cannot be performed, stop and report the issue immediately. Security checks take priority over all other actions.

At the end of each session, provide a summary of all security scans performed, all errors and vulnerabilities found, and all remediation steps taken or attempted by the AI agent.

The AI agent must attempt to automatically correct all detected errors, vulnerabilities, and secrets before session completion. If remediation is not possible, report the issue and reason.

If an error occurs in any MCP server tool call (such as missing required parameters like version, invalid arguments, or tool invocation failures):

- The AI agent must review the error, determine the cause, and automatically correct the tool call or input parameters.
- Re-attempt the tool call with the corrected parameters.
- Continue this process until the tool call succeeds or it is determined that remediation is not possible, in which case the issue and reason must be reported.

For troubleshooting, ensure the MCP server is running and `endorctl` is installed and accessible in your environment.
