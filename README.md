# Terminal Setup Script

Automated setup script for a modern, feature-rich terminal experience using Oh My Zsh with enhanced plugins.

## Features

This script installs and configures:

- **Oh My Zsh** - Popular framework for managing Zsh configuration
- **Agnoster theme** - Clean, informative prompt with git integration
- **zsh-autosuggestions** - Fish-like autosuggestions for zsh
- **zsh-syntax-highlighting** - Syntax highlighting for the command line
- **fast-syntax-highlighting** - Enhanced syntax highlighting with additional features
- **zsh-autocomplete** - Real-time type-ahead autocompletion
- **Powerline fonts** - Beautiful fonts for enhanced terminal appearance

## Quick Install

Run this one-liner to automatically set up your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/phuong0111/terminal-setup/main/setup-terminal.sh | bash
```

Or download and run manually:

```bash
wget https://raw.githubusercontent.com/phuong0111/terminal-setup/main/setup-terminal.sh
chmod +x setup-terminal.sh
./setup-terminal.sh
```

## Requirements

- **Operating System**: Debian/Ubuntu (uses apt package manager)
- **Permissions**: sudo access required for package installation
- **Internet**: Active connection for downloading packages and plugins

## What the script does

1. Updates your system package list
2. Installs zsh and required dependencies
3. Downloads and installs Oh My Zsh
4. Clones additional plugin repositories
5. Backs up your existing `.zshrc` configuration
6. Updates `.zshrc` with new plugins and theme settings
7. Sources the updated configuration to apply changes immediately

## Configuration Changes

The script modifies your `~/.zshrc` file:

- **Plugins**: Changes from `plugins=(git)` to `plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)`
- **Theme**: Changes from `ZSH_THEME="robbyrussell"` to `ZSH_THEME="agnoster"`

## After Installation

1. **Set zsh as default shell**:
   ```bash
   chsh -s $(which zsh)
   ```

2. **Start using zsh immediately**:
   ```bash
   zsh
   ```
   Or restart your terminal/open a new tab

3. **Configure your terminal font** to use a Powerline font for best results with the agnoster theme

## Font Recommendations

For the best experience with the agnoster theme, use one of these Powerline-compatible fonts:

- **Ubuntu**: `sudo apt install fonts-powerline`
- **Popular choices**: 
  - Source Code Pro for Powerline
  - DejaVu Sans Mono for Powerline
  - Inconsolata for Powerline

Set your terminal to use one of these fonts in your terminal emulator's preferences.

## Backup

Your original `.zshrc` file is automatically backed up to `.zshrc.backup` before any changes are made.

## Troubleshooting

### Script fails with permission error
Make sure you have sudo privileges and run the script again.

### Plugins not working after installation
1. Restart your terminal completely
2. Ensure zsh is your default shell: `echo $SHELL` should show `/usr/bin/zsh` or `/bin/zsh`

### Theme looks broken
Install and configure a Powerline font in your terminal emulator settings.

### Want to revert changes?
Restore your original configuration:
```bash
cp ~/.zshrc.backup ~/.zshrc
```

## Manual Installation

If you prefer to install manually or want to understand what the script does:

```bash
# Install packages
sudo apt update
sudo apt install zsh zsh-autosuggestions zsh-syntax-highlighting fonts-powerline

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone additional plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_CUSTOM/plugins/fast-syntax-highlighting
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# Update .zshrc manually
nano ~/.zshrc
```

## License

This project is released under the MIT License.
