source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

# SOURCE

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $DOTFILES/zsh/git.zsh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists ~/.fzf.zsh
source_if_exists /usr/local/etc/profile.d/z.sh
source_if_exists /opt/homebrew/etc/profile.d/z.sh

if type "direnv" > /dev/null; then
    eval "$(direnv hook zsh)"
fi

autoload -U zmv
autoload -U promptinit && promptinit
autoload -U colors && colors
autoload -Uz compinit && compinit

if test -z ${ZSH_HIGHLIGHT_DIR+x}; then
else
    source $ZSH_HIGHLIGHT_DIR/zsh-syntax-highlighting.zsh
fi

precmd() {
    source $DOTFILES/zsh/aliases.zsh
}

export VISUAL=nvim
export EDITOR=nvim

# PATHS
export PATH="$PATH:/usr/local/sbin:$DOTFILES/bin:$HOME/.local/bin:$DOTFILES/scripts/"

# OMZ settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dst"
plugins=()
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 60

# LOAD OMZ
source $ZSH/oh-my-zsh.sh