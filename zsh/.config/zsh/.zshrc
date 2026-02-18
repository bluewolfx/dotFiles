#!/bin/zsh

# Detect OS and distribution
case "$OSTYPE" in
    darwin*)
        OS="macos"
        ;;
    linux-gnu*)
        OS="linux"
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            DISTRO="$ID"
        fi
        ;;
    *)
        OS="unknown"
        ;;
esac

# p10k instant prompt (macOS only, requires powerlevel10k theme)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/bin:/usr/local/bin:$PATH

autoload -U compinit; compinit
if [ -f ~/projects/fzf-tab/fzf-tab.plugin.zsh ]; then
    source ~/projects/fzf-tab/fzf-tab.plugin.zsh
fi

if command -v register-python-argcomplete &> /dev/null; then
    eval "$(register-python-argcomplete pipx)"
fi

ZSH_THEME="robbyrussell"
setopt NO_BANG_HIST

plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
zsh-completions
brew
battery
branch
copypath
docker
docker-compose
golang
postgres
thefuck
web-search
jsontools
fzf-tab
sudo
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR='nvim'

alias ga="git add"
alias gc="git commit -m"
alias gcb="git checkout -b"
alias gst="git status"
alias gb="git branch"
alias gps="git push"
alias gpso="git push origin"
alias gpl="git pull"
alias grm="git rm -r"
alias clr="clear"
alias dockerUp="docker-compose up -d"
alias dockerDown="docker-compose down -v"
alias dockerUBuild="docker-compose up -d --build"
alias bi="brew install"
alias ld="lazydocker"
alias lg="lazygit"
alias l='eza -l --icons --git --header --group-directories-first'
alias lt='eza --tree --level=2 --icons'



# OS-specific configurations
case "$OS" in
    macos)
        # macOS-specific exports
        export PATH="/usr/local/opt/php@8.0/bin:$PATH"
        export PATH="/usr/local/opt/php@8.0/sbin:$PATH"
        export PATH="/opt/homebrew/bin:$PATH"
        export PATH="/usr/local/opt/python/libexec/bin:$PATH"
        export M2_HOME="/Users/banon/Downloads/apache-maven-3.6.3"
        export PATH="${M2_HOME}/bin:${PATH}"
        export CGO_CFLAGS="-I/usr/local/include/libxls"
        
        # macOS application aliases
        alias subl="'/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'"
        alias intj="'/Applications/IntelliJ IDEA.app/Contents/MacOS/idea'"
        alias dockerd="'/Applications/Docker.app'"
        alias postman="'/Applications/Postman.app'"
        alias spotify="'/Applications/Spotify.app'"
        alias whatsapp="'/Applications/WhatsApp.app'"
        
        # macOS-specific tools
        [ -d "$HOME/Surge" ] && export PATH="$PATH:$HOME/Surge/"
        [ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
        ;;
    
    linux)
        # Linux-specific exports
        export PATH="$PATH:/usr/local/go/bin"
        
        # Homebrew on Linux
        [ -d "/home/linuxbrew/.linuxbrew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        
        # Distribution-specific configurations
        case "$DISTRO" in
            ubuntu)
                # Ubuntu-specific: Fix terminal colors for tmux + SSH
                export TERM=xterm-256color
                export COLORTERM=truecolor
                ;;
            *)
                # Other Linux distributions
                ;;
        esac
        ;;
esac

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$(go env GOPATH)/bin"

if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

if command -v direnv &> /dev/null; then
    eval "$(direnv hook zsh)"
fi

[ -f $ZDOTDIR/.zsh_secrets ] && source $ZDOTDIR/.zsh_secrets
[ -f $ZDOTDIR/.zsh_work ] && source $ZDOTDIR/.zsh_work
