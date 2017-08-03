#!/bin/bash

#XCODE
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  echo "Xcode CLI tools not found. Installing them..."
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$PROD" -v;
else
  echo "Xcode CLI tools OK"
fi

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew doctor
git clone https://github.com/ivanperez/dotfiles.git ~/a/dotfiles
cd ~/a/dotfiles
bash ./install_osx.sh
bash ./install_zsh.sh
bash ./install_node.sh
bash ./install_apps.sh
bash ./install_atom.sh
bash ./install_hyper.sh
bash ./install_tmux.sh
