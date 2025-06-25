---
description: "Dependency vulnerability scanning using Endor Labs via MCP server integration"
applyTo: '**/package.json, **/package-lock.json, **/yarn.lock, **/pnpm-lock.yaml, **/requirements.txt, **/Pipfile, **/Pipfile.lock, **/pyproject.toml, **/poetry.lock, **/go.mod, **/go.sum, **/Cargo.toml, **/Cargo.lock, **/pom.xml, **/build.gradle, **/build.gradle.kts, **/gradle.lockfile, **/composer.json, **/composer.lock'
---
# Software Composition Analysis (SCA) Rule (Endor Labs via MCP)
This project uses [Endor Labs](https://docs.endorlabs.com/) for automated dependency (SCA) scanning, integrated through the MCP server as configured in `.vscode/mcp.json`.
## Workflow
Whenever you add or modify a dependency in any of the files above:
- Run `endor-cli-tools` using the `check_dependency_for_vulnerabilities` tool via the MCP server.
- Provide the **language**, **dependency name**, and **version** as required.
- If a vulnerability is identified:
  - Upgrade to the suggested safe version, or
  - Replace the dependency with a non-vulnerable alternative.
- Re-run the check using `endor-cli-tools` to confirm the issue is resolved.
## Notes
- All scans must be performed using the MCP server integration (`endor-cli-tools`) as configured in `.vscode/mcp.json`. Do not invoke `endorctl` directly.
- For troubleshooting, ensure the MCP server is running and `endorctl` is installed and accessible in your environment.
This rule ensures that all dependency changes are evaluated for risk at the time of introduction, and that the project remains clean and secure after each coding session.