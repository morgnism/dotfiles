#!/bin/bash
set -euo pipefail

echo "Settings up you Mac..."
sudo -v

# Oh My Zsh Install
if test ! $(which zsh); then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Copy Default Oh My Zsh configs
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Copy Mackup config
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Homebrew - Install
echo "Installing Homebrew..."

if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Homebrew - Update Recipes
brew update

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Homebrew - Install Packages
cd ~
echo "Installing Homebrew packages..."

brew tap homebrew/bundle
brew bundle

# Generate SSH key
echo "Generate SSH keys..."
ssh-keygen -t rsa

echo "Copied SSH key to clipboard - You can now add it to Github"
pbcopy < ~/.ssh/id_ed25519.pub

# Register global Git configs
git config --add include.path ~/.dotfiles/.git_aliases
git config --global core.excludesfile ~/.dotfiles/.gitignore_global

echo "Installaton Complete!"