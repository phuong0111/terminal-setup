#!/bin/bash

# Terminal Setup Script
# Installs Oh My Zsh with autosuggestions, syntax highlighting, and autocomplete plugins

set -e  # Exit on any error

echo "🚀 Starting terminal setup..."

# Check if running on a Debian/Ubuntu system
if ! command -v apt &> /dev/null; then
    echo "❌ This script requires apt package manager (Debian/Ubuntu)"
    exit 1
fi

# Update package list
echo "📦 Updating package list..."
sudo apt update

# Install required packages
echo "📦 Installing zsh and dependencies..."
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting fonts-powerline curl git

# Install Oh My Zsh
echo "🔧 Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "✅ Oh My Zsh already installed"
fi

# Set ZSH_CUSTOM if not set
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# Clone additional plugins
echo "🔌 Installing plugins..."

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "✅ zsh-autosuggestions already installed"
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "✅ zsh-syntax-highlighting already installed"
fi

# fast-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/fast-syntax-highlighting" ]; then
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"
else
    echo "✅ fast-syntax-highlighting already installed"
fi

# zsh-autocomplete
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autocomplete" ]; then
    git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"
else
    echo "✅ zsh-autocomplete already installed"
fi

# Backup existing .zshrc
if [ -f "$HOME/.zshrc" ]; then
    echo "💾 Backing up existing .zshrc to .zshrc.backup"
    cp "$HOME/.zshrc" "$HOME/.zshrc.backup"
fi

# Update .zshrc configuration
echo "⚙️  Updating .zshrc configuration..."

# Update plugins line
sed -i 's/^plugins=(git)$/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/' "$HOME/.zshrc"

# Update theme
sed -i 's/^ZSH_THEME="robbyrussell"$/ZSH_THEME="agnoster"/' "$HOME/.zshrc"

echo "✅ Terminal setup complete!"
echo ""
echo "🎉 Next steps:"
echo "1. Run 'chsh -s $(which zsh)' to set zsh as your default shell"
echo "2. Log out and log back in, or restart your terminal"
echo "3. Your old .zshrc has been backed up to .zshrc.backup"
echo ""
echo "📝 Note: The agnoster theme works best with Powerline fonts."
echo "   Make sure your terminal is configured to use a Powerline font."
