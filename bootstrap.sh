#!/usr/bin/env bash

git clone https://github.com/thorbenbelow/dotfiles-stow.git $HOME/.dotfiles
cd $HOME/dotfiles

if command -v stow &> /dev/null
then
	find . -type d -maxdepth 1 -mindepth 1 -exec bash -c ' stow $(basename "$0")' {} \;
fi

if command -v zsh &> /dev/null
then	
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
	chsh -s $(which zsh)
fi

if command -v nvim &> /dev/null
then
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	vim 'PlugInstall --sync' +qa
fi
