export ZSH="$HOME/.oh-my-zsh"

RPI=192.168.0.2

ZSH_THEME="robbyrussell"
# Good themes: robbyrussell afowler af-magic dieter
HIST_STAMPS="yyyy-mm-dd"

plugins=(
	git
	docker
	docker-compose
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOPATH/bin

# Env
export LANG=en_US.UTF-8
export EDITOR='nvim'

if [ -f ~/.zsh/completions/_zsh ]; then
    source ~/.zsh/completions/_zsh
fi

# Zoxide
eval "$(zoxide init zsh)"

# Config
alias dotconfig="nvim ~/.dotfiles/"
alias zshconfig="nvim ~/.zshrc"
alias nvimconfig="nvim ~/.config/nvim/init.lua"
alias ohmyzsh="code ~/.oh-my-zsh"
alias config="/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME"
alias pkglist="nvim ~/.myconf/init/pkg.txt"
alias o="xdg-open"

# Files and directories
alias cat="bat -n"

if command -v exa &> /dev/null
then
  alias ls="exa"
  alias l="exa --long --all"
  alias la="exa --long --all"
  alias ll="clear && la"
fi

# Terraform
if command -v terraform &> /dev/null
then
  alias t="terraform"
  alias ti="terraform init"
  alias tiu="terraform init -upgrade"
  alias tp="terraform plan"
  alias tpp="terraform plan -out planned"
  alias ta="terraform apply"
  alias tap="terraform apply planned"
fi

# Git
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
alias gm="git commit -S -s -m"

# kube
if command -v kubectl &> /dev/null
then
  alias km="kubectl --kubeconfig ~/dev/pv/kube/k3s/k3s.yaml"
  alias k="kubectl"
  alias kustom="kubectl apply -k"
fi

# Docker
if command -v docker &> /dev/null
then
  alias d="docker"
  alias dcu="docker compose up"
  alias dcd="docker compose down"
  alias docker-compose="docker compose"
  alias pidocker="DOCKER_HOST=ssh://pi@$RPI docker"
fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/thorben/dev/tools/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/thorben/dev/tools/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/thorben/dev/tools/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/thorben/dev/tools/google-cloud-sdk/completion.zsh.inc'; fi

. <(flux completion zsh)
. <(kubectl completion zsh)
. <(docker completion zsh)
. <(minikube completion zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
