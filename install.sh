#!/bin/bash
set -e

# Termi Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/archit0/homebrew-termi/main/install.sh | bash

INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"
REPO="archit0/homebrew-termi"

echo "Installing Termi..."

# Check for Python 3
if ! command -v python3 &> /dev/null; then
    echo "Error: Python 3 is required but not installed."
    exit 1
fi

# Check for pip
if ! python3 -m pip --version &> /dev/null; then
    echo "Error: pip is required but not installed."
    exit 1
fi

# Install requests dependency
echo "Installing Python dependencies..."
python3 -m pip install --quiet requests

# Download termi
echo "Downloading termi..."
TEMP_FILE=$(mktemp)
curl -fsSL "https://raw.githubusercontent.com/${REPO}/main/termi" -o "$TEMP_FILE"

# Install to INSTALL_DIR
if [ -w "$INSTALL_DIR" ]; then
    mv "$TEMP_FILE" "$INSTALL_DIR/termi"
    chmod +x "$INSTALL_DIR/termi"
else
    echo "Need sudo to install to $INSTALL_DIR"
    sudo mv "$TEMP_FILE" "$INSTALL_DIR/termi"
    sudo chmod +x "$INSTALL_DIR/termi"
fi

echo ""
echo "Termi installed successfully!"
echo "Run 'termi' to get started."
