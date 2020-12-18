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
brew install yarn

# Install MacOS Applications
brew cask install intellij-idea
brew cask install webstorm
brew cask install postman
brew cask install google-chrome
brew cask install firefox
brew cask install macvim
brew cask install odlp/bluesnooze/bluesnooze
