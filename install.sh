#!/bin/bash
set -e
echo "=== Starting Mac setup ==="

# -------------------------
# 1. Homebrew
# -------------------------
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo "Installing Homebrew packages from Brewfile..."
brew bundle --file=Brewfile

# -------------------------
# 2. Python
# -------------------------
if command -v python3 &> /dev/null; then
    echo "Installing Python packages..."
    pip3 install --upgrade pip
    pip3 install -r requirements.txt
else
    echo "Python3 not found. Skipping Python setup."
fi

# -------------------------
# 3. R packages
# -------------------------
if command -v Rscript &> /dev/null; then
    echo "Installing R packages..."
    while read pkg ver; do
        Rscript -e "if (!require('$pkg', character.only=TRUE) || packageVersion('$pkg') != '$ver') install.packages('$pkg', repos='https://cloud.r-project.org')"
    done < R_packages.txt
else
    echo "Rscript not found. Skipping R setup."
fi

# -------------------------
# 4. npm global packages
# -------------------------
if command -v npm &> /dev/null; then
    echo "Installing npm global packages..."
    xargs -n 1 npm install -g < npm_global.txt
else
    echo "npm not found. Skipping npm setup."
fi

# -------------------------
# 5. Dotfiles
# -------------------------
echo "Linking dotfiles..."
DOTFILES_DIR="$PWD/dotfiles"
ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig

echo "=== Mac setup complete! ==="
