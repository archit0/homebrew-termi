#!/bin/bash
set -e

# Termi Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/archit0/homebrew-termi/main/install.sh | bash

INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"
REPO="archit0/homebrew-termi"

echo ""
echo "  ⚡ Termi Installer"
echo "  ─────────────────────────────────"
echo ""

# Check for Python 3
echo "  [1/4] Checking Python 3..."
if ! command -v python3 &> /dev/null; then
    echo "  ✗ Error: Python 3 is required but not installed."
    exit 1
fi
echo "  ✓ Python 3 found: $(python3 --version)"

# Check for pip
echo "  [2/4] Checking pip..."
if ! python3 -m pip --version &> /dev/null; then
    echo "  ✗ Error: pip is required but not installed."
    echo "    On Ubuntu/Debian: sudo apt install python3-pip"
    echo "    On Fedora: sudo dnf install python3-pip"
    exit 1
fi
echo "  ✓ pip found"

# Install requests dependency
echo "  [3/4] Installing Python dependencies..."
if python3 -c "import requests" &> /dev/null; then
    echo "  ✓ Dependencies already installed"
elif command -v apt &> /dev/null; then
    sudo apt install -y python3-requests > /dev/null 2>&1
    echo "  ✓ Dependencies installed"
else
    python3 -m pip install --quiet --break-system-packages requests 2>/dev/null || \
    python3 -m pip install --quiet --user requests
    echo "  ✓ Dependencies installed"
fi

# Download termi
echo "  [4/4] Downloading termi..."
TEMP_FILE=$(mktemp)
curl -fsSL "https://raw.githubusercontent.com/${REPO}/main/termi" -o "$TEMP_FILE"

# Ensure INSTALL_DIR exists
if [ ! -d "$INSTALL_DIR" ]; then
    if [ -w "$(dirname "$INSTALL_DIR")" ]; then
        mkdir -p "$INSTALL_DIR"
    else
        sudo mkdir -p "$INSTALL_DIR"
    fi
fi

# Install to INSTALL_DIR
if [ -w "$INSTALL_DIR" ]; then
    mv "$TEMP_FILE" "$INSTALL_DIR/termi"
    chmod +x "$INSTALL_DIR/termi"
else
    echo "  → Need sudo to install to $INSTALL_DIR"
    sudo mv "$TEMP_FILE" "$INSTALL_DIR/termi"
    sudo chmod +x "$INSTALL_DIR/termi"
fi
echo "  ✓ Installed to $INSTALL_DIR/termi"

echo ""
echo "  ─────────────────────────────────"
echo "  ✓ Termi installed successfully!"
echo ""
echo "  Get started:"
echo "    termi              # Interactive mode + setup"
echo "    termi list files   # Run a command"
echo ""
echo "  Options:"
echo "    termi --config     # Change LLM provider"
echo "    termi --help       # Show help"
echo ""
