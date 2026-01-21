# Termi

A natural language terminal command executor. Translate plain English into shell commands using LLM APIs.

## Features

- **Natural Language to Shell**: Convert commands like "list all files" to `ls -la`
- **Multiple LLM Providers**: Support for OpenAI, Anthropic (Claude), and Ollama (local)
- **Multi-Command Support**: Handle complex requests like "go to /tmp and create folder test"
- **Smart Permissions**: Auto-execute trusted commands with granular prefix-based allowlisting
- **Interactive Setup**: Arrow-key driven configuration with secure API key storage
- **Safety First**: Dangerous commands are flagged and require confirmation

## Installation

### Homebrew (macOS)

```bash
brew tap archit0/termi
brew install termi
```

### Manual

```bash
# Clone the repository
git clone https://github.com/archit0/termi.git
cd termi

# Install dependencies
pip install requests

# Make executable (optional)
chmod +x termi

# Add to PATH (optional)
sudo ln -s $(pwd)/termi /usr/local/bin/termi
```

## Quick Start

```bash
# Run for the first time (starts interactive setup)
./termi

# Or run with a command directly
./termi list all files
```

## Configuration

On first run, Termi will guide you through setup:

1. **Select Provider**: OpenAI, Anthropic, or Ollama (local)
2. **Choose Model**: Select from suggested models or enter custom
3. **API Key**: Enter your API key (stored securely in `~/.termi/config.json`)

To reconfigure:
```bash
termi --config
```

### Supported Providers

| Provider | Models | API Key Required |
|----------|--------|------------------|
| OpenAI | gpt-5.2, gpt-5-mini, gpt-5-nano, gpt-4o, gpt-4o-mini | Yes |
| Anthropic | claude-sonnet-4-5, claude-haiku-4-5, claude-opus-4-5 | Yes |
| Ollama | Any locally installed model | No |

## Usage

### Direct Commands

```bash
# Basic commands
termi list all files
termi show disk usage
termi find python files in src folder
termi count lines in all javascript files

# Multi-step commands
termi go to /tmp and create a folder called test
termi find large files and sort by size

# With auto-execute flag
termi -y list all files
```

### Interactive Mode

```bash
# Start interactive mode
termi

# Inside interactive mode:
termi❯ show me running processes
termi❯ find files modified today
termi❯ permissions    # manage auto-execute settings
termi❯ exit
```

### Command Line Options

| Option | Description |
|--------|-------------|
| `termi` | Start interactive mode |
| `termi <command>` | Execute a natural language command |
| `termi --config` or `-c` | Reconfigure settings |
| `termi --permissions` or `-p` | Manage auto-execute permissions |
| `termi --yes` or `-y` | Auto-execute without confirmation |
| `termi --help` or `-h` | Show help message |

## Permissions

Termi lets you set up auto-execute rules for trusted commands.

### Managing Permissions

```bash
# From command line
termi --permissions

# Or in interactive mode
termi❯ permissions
```

### Permission Options

- **Toggle auto-execute ALL**: Execute all commands without confirmation
- **Add allowed prefix**: Auto-execute commands starting with specific prefix (e.g., `ls`, `git`)
- **Remove/Clear prefixes**: Manage existing rules

### How Prefixes Work

When you choose "Always allow" for a command:
- `ls -la` → allows all commands starting with `ls`
- `sudo ps aux` → allows all commands starting with `sudo ps`
- `git status` → allows all commands starting with `git`

### Interactive Mode Commands

| Command | Description |
|---------|-------------|
| `permissions` or `perms` | Open permissions manager |
| `allowed` | Show current auto-execute rules |
| `reset` | Clear all auto-execute permissions |
| `config` | Reconfigure LLM settings |
| `exit` or `quit` | Exit interactive mode |

## Examples

```bash
# File operations
termi list all hidden files
termi find files larger than 100mb
termi show the last 50 lines of app.log

# System info
termi show memory usage
termi list running docker containers
termi show my ip address

# Git operations
termi show git status
termi show recent commits
termi list branches

# Complex operations
termi find all TODO comments in python files
termi compress the logs folder into a tar.gz
termi show processes using port 3000
```

## Configuration File

Settings are stored in `~/.termi/config.json`:

```json
{
  "provider": "openai",
  "model": "gpt-4o",
  "api_key": "sk-...",
  "api_keys": {
    "openai": "sk-...",
    "anthropic": "sk-ant-..."
  },
  "auto_execute_all": false,
  "allowed_prefixes": ["ls", "git", "docker ps"]
}
```

API keys are stored per-provider, so switching providers preserves your keys.

## Safety

Termi includes safety measures:
- Commands are shown before execution
- Dangerous/destructive commands are flagged as unsafe
- Confirmation required by default
- Granular permission controls

## Requirements

- Python 3.7+
- `requests` library
- API key for OpenAI/Anthropic, or local Ollama installation

## License

MIT

## Contributing

Contributions welcome! Please open an issue or submit a pull request.
