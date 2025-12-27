#!/bin/bash
set -e
echo "=== Bootstrap Mac setup ==="

# -------------------------
# 1. Install Homebrew
# -------------------------
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew already installed."
fi

# -------------------------
# 2. Install Python3
# -------------------------
if ! command -v python3 &> /dev/null; then
    echo "Python3 not found. Installing via Homebrew..."
    brew install python
else
    echo "Python3 already installed."
fi

# -------------------------
# 3. Install R
# -------------------------
if ! command -v Rscript &> /dev/null; then
    echo "R not found. Installing via Homebrew..."
    brew install --cask r
else
    echo "R already installed."
fi

# -------------------------
# 4. Install nvm & Node.js
# -------------------------
if [ -z "$NVM_DIR" ]; then
    echo "nvm not found. Installing nvm..."
    export NVM_DIR="$HOME/.nvm"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

# Load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js version
NODE_VERSION="20.19.5"  # set your preferred version
if ! nvm ls "$NODE_VERSION" &> /dev/null; then
    echo "Installing Node.js $NODE_VERSION..."
    nvm install "$NODE_VERSION"
fi
nvm use "$NODE_VERSION"

echo "=== Bootstrap complete! ==="
