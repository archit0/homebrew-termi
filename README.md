# Termi - Free AI Terminal & Natural Language Shell

> **Free and open-source AI terminal** - The open alternative to Claude Code, Copilot CLI, and AI command-line tools. Use natural language to execute shell commands with GPT, Claude, or local LLMs.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.7+](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/)

## What is Termi?

Termi is a **free AI terminal assistant** that translates plain English into shell commands. Think of it as an **open-source Claude Code alternative** or **free Copilot CLI** that works with multiple AI providers.

```bash
$ termi find all large files and show disk usage
# AI suggests: du -ah . | sort -rh | head -20
# You approve, it executes!
```

### Why Termi?

- **Free & Open Source** - No subscription required, bring your own API key
- **Works Offline** - Use with Ollama for completely local AI terminal
- **Multi-Provider** - OpenAI (GPT-4, GPT-5), Anthropic (Claude), or Ollama (Llama, Mistral)
- **Agentic Mode** - AI executes commands iteratively until your goal is complete
- **Safe by Default** - Review commands before execution, dangerous commands are blocked

## Features

- **Natural Language to Shell**: "list all files" → `ls -la`
- **Agentic Mode**: AI works autonomously - runs commands, sees output, decides next steps
- **Multiple LLM Providers**: OpenAI, Anthropic (Claude), Ollama (local/free)
- **Smart Permissions**: Auto-execute trusted commands with prefix-based allowlisting
- **Interactive Mode**: REPL-style interface for continuous use
- **Safety First**: Dangerous commands flagged, confirmation required

## Quick Install

### One-Line Install (macOS/Linux)

```bash
curl -fsSL https://raw.githubusercontent.com/archit0/homebrew-termi/main/install.sh | bash
```

### Homebrew (macOS)

```bash
brew tap archit0/termi
brew install termi
```

### Manual Install

```bash
pip install requests
curl -o /usr/local/bin/termi https://raw.githubusercontent.com/archit0/homebrew-termi/main/termi
chmod +x /usr/local/bin/termi
```

## Quick Start

```bash
# First run - interactive setup (choose provider, enter API key)
termi

# Run natural language commands
termi list all files
termi show disk usage
termi find python files modified today

# Agentic mode - AI works until goal is complete
termi --agent "cleanup all node_modules folders"
termi --agent "find and fix permission issues"
termi --agent "setup a new git repo with README"
```

## Agentic Mode - Autonomous AI Terminal

Agentic mode lets the AI work **autonomously** - it runs a command, observes the output, and decides what to do next until your goal is achieved.

```bash
$ termi --agent "find the largest files taking up disk space"

══════════════════════════════════════════════════
  🤖 Termi Agentic Mode
══════════════════════════════════════════════════

Goal: find the largest files taking up disk space
Model: ollama/llama3.2

────────────────────────────────────────
Step 1
Tokens: 450 in / 85 out

Reasoning: First, I'll check overall disk usage to understand the situation

Command: df -h

...output...

────────────────────────────────────────
Step 2
Tokens: 520 in / 92 out

Reasoning: Now I'll find the largest files in the current directory

Command: du -ah . | sort -rh | head -20

...output...

══════════════════════════════════════════════════
✓ Goal completed in 2 step(s)
Total tokens: 970 in / 177 out (1147 total)
══════════════════════════════════════════════════
```

### Agentic Mode Examples

```bash
# Cleanup tasks
termi --agent "delete all .pyc files and __pycache__ folders"
termi --agent "find and remove empty directories"

# Investigation tasks
termi --agent "find what's using port 3000"
termi --agent "check why disk space is low"

# Setup tasks
termi --agent "initialize a new python project with venv"
termi --agent "setup git hooks for this repo"
```

## Supported AI Providers

| Provider | Models | Cost | Local |
|----------|--------|------|-------|
| **Ollama** | Llama 3, Mistral, CodeLlama, Phi | Free | Yes |
| **OpenAI** | GPT-5, GPT-4o, GPT-4o-mini | Paid | No |
| **Anthropic** | Claude Opus, Sonnet, Haiku | Paid | No |

### Free Local AI (Ollama)

Use Termi completely free with [Ollama](https://ollama.ai):

```bash
# Install Ollama
curl -fsSL https://ollama.ai/install.sh | sh

# Pull a model
ollama pull llama3.2

# Configure Termi to use Ollama
termi --config  # Select Ollama as provider
```

## Usage

### Direct Commands

```bash
termi list all files
termi show memory usage
termi find files larger than 100mb
termi show git log with graph
termi "compress logs folder to tar.gz"
```

### Interactive Mode

```bash
$ termi

⚡ Termi Interactive Mode
══════════════════════════════════════════════════

termi❯ show running docker containers
termi❯ find TODO comments in python files
termi❯ agent: setup a new nodejs project    # agentic mode
termi❯ permissions                           # manage auto-execute
termi❯ exit
```

### Command Line Options

| Option | Description |
|--------|-------------|
| `termi` | Start interactive mode |
| `termi <command>` | Execute natural language command |
| `termi --agent <goal>` | Run in agentic mode |
| `termi --config` | Configure LLM provider |
| `termi --permissions` | Manage auto-execute rules |
| `termi --help` | Show help |

## Permissions & Safety

Termi includes safety features:

- **Command Preview**: See commands before execution
- **Dangerous Command Blocking**: `rm -rf /`, etc. are blocked
- **Auto-Execute Rules**: Trust specific command prefixes
- **Confirmation Required**: By default, you approve each command

```bash
# Manage permissions
termi --permissions

# Or in interactive mode
termi❯ permissions
```

## Configuration

Config stored in `~/.termi/config.json`:

```json
{
  "provider": "ollama",
  "model": "llama3.2",
  "api_keys": {
    "openai": "sk-...",
    "anthropic": "sk-ant-..."
  },
  "auto_execute_all": false,
  "allowed_prefixes": ["ls", "git", "docker ps"]
}
```

## Comparison

| Feature | Termi | Claude Code | GitHub Copilot CLI |
|---------|-------|-------------|-------------------|
| Open Source | Yes | No | No |
| Free Option | Yes (Ollama) | No | No |
| Local/Offline | Yes | No | No |
| Agentic Mode | Yes | Yes | No |
| Multi-Provider | Yes | Claude only | GPT only |

## Keywords

AI terminal, AI CLI, natural language shell, GPT terminal, Claude terminal, free Claude Code alternative, open source Copilot CLI, AI command line, LLM terminal, natural language to bash, AI shell assistant, free AI coding assistant, Ollama terminal, local AI terminal, open source AI terminal, command line AI, terminal AI assistant, shell GPT, Claude CLI, GPT CLI, AI bash, intelligent terminal

## Requirements

- Python 3.7+
- `requests` library
- API key (OpenAI/Anthropic) OR Ollama installed locally

## License

MIT License - Free for personal and commercial use.

## Contributing

Contributions welcome! Open an issue or submit a PR.

---

**Star this repo** if you find it useful! It helps others discover this free AI terminal tool.
