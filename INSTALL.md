# Installation

## Quick Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/archit0/homebrew-termi/main/install.sh | bash
```

## Homebrew (macOS)

```bash
brew install archit0/homebrew-termi/termi
```

## Manual Installation

### Prerequisites
- Python 3.7+
- pip

### Steps

1. Clone the repository:
```bash
git clone https://github.com/archit0/homebrew-termi.git
cd homebrew-termi
```

2. Install dependencies:
```bash
pip install requests
```

3. Make executable and add to PATH:
```bash
chmod +x termi
sudo ln -s $(pwd)/termi /usr/local/bin/termi
```

## Custom Install Directory

```bash
INSTALL_DIR=~/.local/bin curl -fsSL https://raw.githubusercontent.com/archit0/homebrew-termi/main/install.sh | bash
```

## Verify Installation

```bash
termi --help
```

## First Run

On first run, Termi will guide you through setup:

1. Select provider (OpenAI, Anthropic, or Ollama)
2. Choose model
3. Enter API key (not needed for Ollama)

```bash
termi
```

## Local Setup with Ollama (No API Key)

1. Install Ollama: https://ollama.ai
2. Pull a model:
```bash
ollama pull llama3.2
```
3. Run termi and select Ollama as provider:
```bash
termi --config
```

## Uninstall

```bash
sudo rm /usr/local/bin/termi
rm -rf ~/.termi
```

Or if installed via Homebrew:
```bash
brew uninstall termi
brew untap archit0/homebrew-termi
```
