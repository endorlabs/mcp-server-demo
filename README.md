# 🧬 Endor Labs MCP Vibe Template

This repo is a minimal setup to kickstart secure, AI-assisted development using Cursor, GitHub, and Endor Labs MCP.

It includes:

✅ .cursor/ — Cursor agent policy rules (MCP rules)

✅ .github/ — Baseline GitHub config

✅ .vscode/ — VS Code project settings

🧪 Preconfigured MCP server setup and Copilot instructions

Repo: github.com/endorlabs/mcp-server-demo

## 🚨 Prerequisites

Install endorctl

Authenticate it to your Endor Labs tenant:

```bash
endorctl init --auth-mode=<insert_your_auth_mode_here>
```

Full docs here 👉 [Endor Labs IDE Integration Guide](https://docs.endorlabs.com/deployment/ide/mcp/)

🛠️ Setup

1. Clone this repo

```bash
git clone https://github.com/endorlabs/mcp-server-demo.git
cd mcp-server-demo
```

2. Open it in Cursor

Launch Cursor and open this repo folder. Make sure agent mode is enabled.

No additional configuration needed — the MCP server and policy files are already set up.

## 🧠 Try This Demo Prompt

In Cursor, paste this into the agent:

```yaml
“Create a TODO list app with a React frontend and Python backend. The app must support creating Todo items with an expiration date and have the ability to delete items from the Todo list. Please do not create a readme and just do the code.”
```

MCP will:

Scan generated code

Check for risky dependencies

Flag security issues

Help you vibe responsibly

## ⚙️ How It Works

Dependency added? MCP scans it.

Code generated? MCP scans that too.

Findings? You fix or iterate.

Still confused? Read the full docs.

🤝 Contributing

This is a demo repo. PRs welcome to improve rules, examples, or vibes.

