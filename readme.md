# Dotfiles

## Dependencies
- curl
- stow
- zsh
- git
- vim

## Quickstart
```Bash
curl -sfL https://raw.githubusercontent.com/thorbenbelow/dotfiles-stow/main/bootstrap.sh | sh -s -
```

## Add module
```
stow <dir>
```

## Setup zsh dependencies
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
chsh -s $(which zsh)
```

## Auto Loaded Configuration
- Git: `~/.gituser`
- zsh: `~/.zshrc.local`
