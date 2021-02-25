#!/usr/bin/env bash

# Install Brew Packages
brew install tree
brew install fzf
# shellcheck disable=SC2046
$(brew --prefix)/opt/fzf/install
brew install ripgrep
brew install fd
brew install the_silver_searcher
brew install bat
brew install python
brew install node
brew install hey

# Install MacOS Applications
brew install --cask odlp/bluesnooze/bluesnooze
