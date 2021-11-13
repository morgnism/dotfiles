#!/bin/bash

echo "Settings up you Mac..."

# Check for Oh My Zsh and install
if test ! $( which '~/.oh-my-zsh'); then
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Remove old files and symlink Oh My Zsh configs
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Remove old files and symlink Mackup config
rm -rf $HOME/.mackup.cfg
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg


# Homebrew - Install
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install/Update NVM
echo "Installing/Updating nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Homebrew - Update Recipes
echo "Updating homebrew..."
brew update

# Homebrew - Install Packages
cd ~
echo "Installing Homebrew packages..."

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle -v --file=$HOME/.dotfiles/Brewfile

# Remove any older version from the cellar
brew cleanup


# Set default MySQL root password and auth type.
if test ! -f "$(which mysql)"; then
    echo "Setting up MySQL..."
    mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"
fi

echo "MySQL default user root@localhost set..."
echo "user: root"
echo "url: localhost"
echo "password: password"


# Generate SSH key
SSH_KEY=$HOME/.ssh/id_rsa.pub

if test ! -f "$SSH_KEY"; then
    echo "Generate SSH keys..."
    ssh-keygen -t rsa
fi

echo "Copied SSH key to clipboard - You can now add it to Github"
pbcopy < ~/.ssh/id_rsa.pub

# Register global Git configs
git config --global core.excludesfile ~/.dotfiles/.gitignore_global

echo "Installaton Complete!"
