# Dotfiles Introduction

This repository contains packages for setup and maintenance of a developer environment across Mac computers. While this is my preferred setup, which includes some base packages needed for a development, any packages can be removed or added to to fit any need.

__Dotfiles supports Intel and M1 Macs!__

If you're new to using dotfiles and have a fresh Mac, continue on.
If you're migrating from a Time Machine backup, [jump to here](#migration-from-a-time-machine-backup)

## What Am I Installing?

These dotfiles use `zshell`, [Homebrew](https://brew.sh/) to manage packages, and `nvm` (which is installed separately from brew).

When performing the install, dotfiles will check for the existance of these packages and install them before Homebrew installs any packages.

Packages installed by Homebrew include:
- Helpful and powerful cli and Mac utilities
- Ideal apps and tools for developer enablement
- Additional and supported fonts
- And some additonal App Store-specific applications

_Note: not all packages are needed and can be modified in the `Brewfile`. To add more packages, look up the correct package name in [Homebrew's available formulaes](https://formulae.brew.sh/)_

# A Fresh macOS Setup

These instructions are for when you've already set up your dotfiles. If you want to get started with your own dotfiles you can [find instructions below](#extended-and-modified-from).
## Pre-install Requirements

First, go through the checklist below to make sure you didn't forget anything before you wipe your hard drive.

✅ Did you commit and push any changes/branches to your git repositories?

✅ Did you remember to save all important documents from non-iCloud directories?

✅ Did you save all of your work from apps which aren't synced through iCloud?

✅ Did you update [mackup](https://github.com/lra/mackup) to the latest version and run `mackup backup`?

## Installing macOS cleanly

Follow [this article](https://www.imore.com/how-do-clean-install-macos) to cleanly install the latest macOS version.

## Setting up your Mac

Follow these steps to setup a new Mac:

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy your public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Run `fresh.sh` to start the installation
7. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
8. Restart your computer to finalize the process

Your Mac is now ready to use!

> Note: you can use a different location than `~/.dotfiles` if you want. Just make sure you also update the reference in the [`.zshrc`](./.zshrc) file.

# Migration from a Time Machine Backup

These instructions are for when you want to migrate from an older backup. This assumes that you have a pre-existing Homebrew install or development setup with some existing apps and packages.

## Intel vs M1 Macs
If you're like me and have a Time Machine backup from an Intel Mac, you can still perform a migration on an M1 Mac, but Homebrew will be installed in the wrong location.

### Verify Old Homebrew Install
Intel Macs should have Homebrew installed at this location:
```bash
$ which brew # /usr/local/Homebrew
```

### Fix the old install
Fixing the old install is quite simple with the following steps:
- Uninstall Homebrew
- Remove any leftover files `Cask`, `Cellar`, and `Frameworks` under `/usr/local/`
- Reinstall Homebrew

Removing the old files won't be an issue because Homebrew installs metadata for packages it installs at those locations and won't affect already installed packages. You will notice several failures for packages already installed.

### Verify New Homebrew Install
M1 Macs should have Homebrew installed at this new location:
```bash
$ which brew # /opt/homebrew
```

References:
- [Uninstall Homebrew](https://ralphjsmit.com/uninstall-homebrew/)
- [Install Homebrew](https://mac.install.guide/ruby/3.html)
- [Housekeeping for Homebrew on M1 Macs](https://mac.install.guide/homebrew/8.html)

## Extended and Modified from

Original blog about Dotfiles and how to create your own can be found in [Dries Vints' dotfiles](https://github.com/driesvints/dotfiles). I originally followed his work and added my own flavour.

[Learn About Dotfiles](https://dotfiles.github.io/)

_Note: His dotfiles uses a LAMP stack setup, but I stripped those down for my own general use. Any additions will most likely become extensions in branches/tags for other stacks (MEAN, JAM, etc)._
