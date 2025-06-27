#!/bin/bash
set -e
if ! command -v zsh >/dev/null 2>&1; then
    echo "Zsh not found. Installing..."
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        if command -v apt >/dev/null 2>&1; then
            sudo apt update && sudo apt install -y zsh
        elif command -v dnf >/dev/null 2>&1; then
            sudo dnf install -y zsh
        elif command -v pacman >/dev/null 2>&1; then
            sudo pacman -Syu --noconfirm zsh
        else
            echo "Unsupported Linux distribution. Please install zsh manually."
            exit 1
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command -v brew >/dev/null 2>&1; then
            echo "Homebrew not found. Please install Homebrew first: https://brew.sh"
            exit 1
        fi
        brew install zsh
    else
        echo "Unsupported OS. Please install zsh manually."
        exit 1
    fi
fi
ZSH_CONFIG_DIR="$HOME/.config/zsh"
mkdir -p "$ZSH_CONFIG_DIR"
cp -r .git .gitignore .zprofile zsh-autosuggestions.zsh zsh-syntax-highlighting zsh-syntax-highlighting.zsh "$ZSH_CONFIG_DIR/"
cp .zshrc "$ZSH_CONFIG_DIR/.zshrc"
ln -sf "$ZSH_CONFIG_DIR/.zshrc" "$HOME/.zshrc"
echo "Installation Completed."
