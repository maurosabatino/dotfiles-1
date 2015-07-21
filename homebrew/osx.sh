#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

set -e

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

cd "$(dirname "$0")"

# homebrew packages

TAPS=(
    homebrew/binary
    homebrew/science
    caskroom/cask
)

FORMULAS=(
    youtube-dl
    ffmpeg
    git
    git-flow
    wget
    nmap
    python
    python3
    node
    ruby
    go
    awscli
    caskroom/cask/brew-cask
)

CASKS=(
    spectacle
    dropbox
    firefox
    google-chrome
    google-hangouts
    toggldesktop
    mou
    appcleaner
    cyberduck
    simple-comic
    arduino
    lastpass
    gpgtools
    iterm2
    osxfuse
    skype
    spotify
    vlc
    the-unarchiver
    vagrant
    virtualbox
    boot2docker
    wireshark
    kitematic
    xquartz
    java
    android-studio
    intellij-idea
    phpstorm
    pycharm
    atom
    textwrangler
    emacs
    mactex
    ansible
    sparkleshare
)

for tap in ${TAPS[@]}
do
    brew tap $tap
done

brew install ${FORMULAS[@]}

brew update

brew cask install --appdir=/Applications ${CASKS[@]}

brew install graphviz --with-gts

#brew cask alfred link

brew cleanup

exit 0
