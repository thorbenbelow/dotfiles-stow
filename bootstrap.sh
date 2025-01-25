#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"
	apt update -y && apt install -y git stow curl zsh vim
elif [[ "$OSTYPE" == "darwin"* ]]; then
	brew install git stow curl zsh nvim
fi

git clone https://github.com/thorbenbelow/dotfiles-stow.git $HOME/.dotfiles
cd $HOME/.dotfiles


if command -v stow &> /dev/null
then
#	find . -type d -maxdepth 1 -mindepth 1 -exec bash -c ' stow $(basename "$0")' {} \;
	stow -R -t $HOME git

	mkdir -p $HOME/.config/nvim
	stow -R -t $HOME/.config/nvim nvim

	stow -R -t $HOME zsh

	mkdir -p $HOME/.config/ghostty	
	stow -R -t $HOME/.config/ghostty ghostty

fi

if command -v zsh &> /dev/null
then	
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
	chsh -s $(which zsh)
fi
