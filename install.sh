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
