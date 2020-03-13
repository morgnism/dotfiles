#!/bin/bash
set -euo pipefail

echo "Settings up you Mac..."
sudo -v

# Oh My Zsh Install
if test ! $(which zsh); then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# Remove old files and symlink Oh My Zsh configs
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Remove old files and symlink Mackup config
rm -rf $HOME/.mackup.cfg
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

homebrew_packages=(
# Binaries
'git'
'bash' # Latest Bash version
'bat' # "cat" on steroids
'coreutils' # Those that come with macOS are outdated
'grep' # Plain-text data regexp search
'httpie' # CLI HTTP commands
'mackup' # Backup configs
'mas' # Mac App Store manager
'trash' # Manage the Trash bin
'tree' # List directories in a tree structure
'zlib' # Needed for Memcached

# Development
'node'
'yarn'

# Zsh Plugins
'zsh-syntax-highlighting'
'zsh-autosuggestions'
)

for homebrew_package in "${homebrew_packages[@]}"; do
 brew install "$homebrew_package"
done

# Install Casks
echo "Installing Homebrew cask packages..."

brew tap homebrew/cask
brew tap homebrew/cask-fonts
brew tap homebrew/cask-versions
brew tap homebrew/bundle

homebrew_cask_packages=(
# Apps
'iterm2'
'alfred'
'caffeine'
'discord'
'docker'
'firefox'
'github'
'google-backup-and-sync'
'google-chrome'
'insomnia'
'slack'
'sublime-text'
'there'
'the-unarchiver'
'android-studio'
'rocket'
'spotify'
'zoomus'

# Fonts
'font-lato'
'font-open-sans'
'font-roboto'
'font-roboto-condensed'
'font-source-code-pro-for-powerline'
'font-source-code-pro'
'font-source-sans-pro'
'font-source-serif-pro'
)

for homebrew_cask_package in "${homebrew_cask_packages[@]}"; do
  brew cask install "$homebrew_cask_package"
done

mas install 'Byword', id: 420212497
mas install 'Things', id: 904280696
mas install '1Password' id:443987910

# Generate SSH key
echo "Generate SSH keys..."
ssh-keygen -t rsa

echo "Copied SSH key to clipboard - You can now add it to Github"
pbcopy < ~/.ssh/id_ed25519.pub

# Register global Git configs
git config --add include.path ~/.dotfiles/.git_aliases
git config --global core.excludesfile ~/.dotfiles/.gitignore_global

echo "Installaton Complete!"