# Morganistic's Dotfiles

This repository contains Dotfiles for my macOS. It simplfies the setup process and keeps configs consistent accross my machines.

## A Fresh macOS Setup

These instructions are for when you've already set up your dotfiles. If you want to get started with your own dotfiles you can [find instructions below](#your-own-dotfiles).

### Before you re-install

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup`?

### Installing macOS cleanly

After going to our checklist above and making sure you backed everything up, we're going to cleanly install macOS with the latest release. Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

### Setting up your Mac

If you did all of the above you may now follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy your public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Install [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh#getting-started)
7. Run `install.sh` to start the installation
8. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
9. Restart your computer to finalize the process

Your Mac is now ready to use!

> Note: you can use a different location than `~/.dotfiles` if you want. Just make sure you also update the reference in the [`.zshrc`](./.zshrc) file.

## Extended and Modified from...

Took a few note from [Dries Vints' dotfiles](https://github.com/driesvints/dotfiles) and [Duncan Mcclean's dotfiles](https://github.com/driesvints/dotfiles), and added my own flavour for my use.

Their dotfiles uses a LAMP stack setup, but I stripped those down for my own general use. Any additions will most likely become extensions in branches/tags for other stacks (MEAN, JAM, etc).
