# Mac Setup and Configuration

This repository tracks and automates the setup of my Mac. It allows me to recreate my dev environment on a fresh Mac quickly, including shell, Git, Homebrew, Python, R, Node.js/npm, and global packages. Thanks to Past Edgar.

````
mac-setup/
│
├─ dotfiles/                 # Your personal shell and Git config files
│   ├─ .zshrc
│   └─ .gitconfig
│
├─ Brewfile                  # List of Homebrew packages & casks
├─ requirements.txt          # Python packages with versions
├─ R_packages.txt            # R packages (installed)
├─ npm_global.txt            # Global npm packages
│
├─ bootstrap.sh              # Installs system-level software (Homebrew, Python3, R, nvm/Node)
├─ setup.sh                  # Installs packages and links dotfiles
├─ create_config.sh          # Updates/exports current Mac configuration to versioned files
└─ README.md                 # This documentation
````


## Purpose

1. Version control your Mac setup: 
Track your shell (.zshrc), Git config, package lists, and global tools

2. Automate environment setup:
Quickly install all tools and packages on a fresh Mac.

3. Recreate or backup Mac configuration
Use create_config.sh to update the repository with your current installed packages and configs.


## Getting Started

```bash
# Step 1: Clone the repository
git clone https://github.com/your-username/mac-setup.git
cd mac-setup
```


## Step 2: Bootstrap system software

Installs Homebrew, Python3, R, nvm, and Node.js

```
chmod +x bootstrap.sh
./bootstrap.sh
```

## Step 3: Install packages and link dotfiles

Installs Homebrew packages, Python packages, R packages, global npm packages, and links dotfiles

```
chmod +x setup.sh
./setup.sh
```

## Step 4: Update your Mac configuration

Run after adding new packages or changing dotfiles to update versioned files

```
chmod +x create_config.sh
./create_config.sh
```

 Mac will now match the environment tracked in this repository
