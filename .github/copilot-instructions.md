# GitHub Copilot Instructions

## Ensure newly added dependencies are checked for vulnerabilities and project stays clean
- globs: '**/package.json, **/package-lock.json, **/yarn.lock, **/pnpm-lock.yaml, **/requirements.txt, **/Pipfile, **/Pipfile.lock, **/pyproject.toml, **/poetry.lock, **/go.mod, **/go.sum, **/Cargo.toml, **/Cargo.lock, **/pom.xml, **/build.gradle, **/build.gradle.kts, **/gradle.lockfile, **/composer.json, **/composer.lock'

Whenever you add or modify a dependency in any of the files above:

- Run the MCP server `endor-cli-tools` using the `check_dependency_for_vulnerabilities` tool.
- Provide the **language**, **dependency name**, and **version**.
- If the tool identifies a vulnerability:
  - Upgrade to the suggested safe version, or
  - Replace the dependency with a non-vulnerable alternative.

This rule ensures that all dependency changes are evaluated for risk at the time of introduction, and that the project remains clean and secure after each coding session.

# Static Application Security Testing (SAST) Rule

- globs: '**/*.c, **/*.cpp, **/*.cc, **/*.cs, **/*.go, **/*.java, **/*.js, **/*.jsx, **/*.ts, **/*.tsx, **/*.py, **/*.php, **/*.rb, **/*.rs, **/*.kt, **/*.kts, **/*.scala, **/*.swift, **/*.dart, **/*.html, **/*.yaml, **/*.yml, **/*.json, **/*.xml, **/*.sh, **/*.bash, **/*.clj, **/*.cljs, **/*.ex, **/*.exs, **/*.lua'

Whenever a supported source code file is modified:

1. Ensure Semgrep is installed and available at version 1.99.0.
   - If Semgrep is not installed or the version is incorrect, prompt the user to install it.
   - Do not proceed with the scan unless Semgrep is available and valid.
   - To install Semgrep, the user must have a working Python environment with pip. Recommend installing version 1.99.0.

2. Use the MCP server `endor-cli-tools` using the tool `scan` to perform a SAST scan on the modified source files.

3. If any vulnerabilities are found:
   - Present the issues to the user.
   - Recommend appropriate fixes (e.g., input sanitization, validation, escaping, secure APIs).
   - Continue scanning until all critical issues have been resolved.

This rule ensures all code changes are automatically reviewed for common security vulnerabilities using `endor-cli-tools` and the MCP server, with Semgrep as the underlying engine.

# Leaked Secrets Detection Rule

Whenever a file is modified in the repository:

- Run `endor-cli-tools` using the `scan` tool with the appropriate arguments to check for leaked secrets.
- Ensure the scan includes all file types and respects `.gitignore` unless otherwise configured.
- If any secrets are detected:
  - Remove the exposed secret immediately.
  - Re-scan to verify the secret has been properly removed.

This rule ensures no accidental credentials, tokens, API keys, or secrets are committed or remain in the project history.