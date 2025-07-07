---
description: "Dependency vulnerability scanning using Endor Labs via MCP server integration"
applyTo: '**/package.json, **/package-lock.json, **/yarn.lock, **/pnpm-lock.yaml, **/requirements.txt, **/Pipfile, **/Pipfile.lock, **/pyproject.toml, **/poetry.lock, **/go.mod, **/go.sum, **/Cargo.toml, **/Cargo.lock, **/pom.xml, **/build.gradle, **/build.gradle.kts, **/gradle.lockfile, **/composer.json, **/composer.lock'
---

# Software Composition Analysis (SCA) Rule (Endor Labs via MCP)
This project uses Endor Labs for automated dependency (SCA) scanning, integrated through the MCP server as configured in `.vscode/mcp.json`.

## Workflow

Every time a manifest or lockfile listed above is created or modified in any way immediantly do the following prior to performing your next task. 

**Important**: Do not procceed after creating or modifying a manifest file without running this first. Do not write any other code or continue with your existing prompt. This is top priority whenever a manifest file is created or updated.

- Run `endor-cli-tools` using the `check_dependency_for_vulnerabilities` tool via the MCP server.
- Provide the **language**, **dependency name**, and **version** always when making this tool call. Do not forget to provide a version.
- If a vulnerability or error is identified:
  - Upgrade to the suggested safe version, or
  - Replace the dependency with a non-vulnerable alternative.
  - The AI agent must attempt to automatically correct all detected errors and vulnerabilities before session completion.
- Re-run the check using `endor-cli-tools` to confirm the issue is resolved.
- If an error occurs in any MCP server tool call (such as missing required parameters like version, invalid arguments, or tool invocation failures):
  - The AI agent must review the error, determine the cause, and automatically correct the tool call or input parameters.
  - Re-attempt the tool call with the corrected parameters.
  - Continue this process until the tool call succeeds or it is determined that remediation is not possible, in which case the issue and reason must be reported.

## Notes
- All scans must be performed using the MCP server integration (`endor-cli-tools`) as configured in `.vscode/mcp.json`. Do not invoke `endorctl` directly.
- For troubleshooting, ensure the MCP server is running and `endorctl` is installed and accessible in your environment.

This rule ensures that all dependency changes are evaluated for risk at the time of introduction, and that the project remains clean and secure after each coding session. The scan may be performed at the end of an agent session, provided all modifications are checked and remediated before session completion.
