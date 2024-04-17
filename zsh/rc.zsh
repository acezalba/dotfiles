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

# ====== PATHS ================================ #

# Source system path
source /etc/environment

# Add home bin to path
export PATH="$PATH:$HOME/bin"

# Add rc repo bin to path
export PATH="$PATH:$DOTFILES/bin"

# Add .local/bin to path
export PATH="$PATH:$HOME/.local/bin"

# Add rc repo scripts to path
 export PATH="$PATH:$DOTFILES/scripts/"

# ===== APP VARS ============================== #

# 2024-02-24, 07:45:50 AM - ansible config
# Expose my home playbook as the default
export ANSIBLE_CONFIG="$HOME/playbooks/ansible.cfg"

# 2024-03-19, 09:33:59 AM - ansible roles path
# debug: expose my roles path for ansible
export ANSIBLE_ROLES_PATH="$HOME/playbooks/roles/"

# 2024-04-17, 08:06:06 PM - pyenv shims
# added pyenv shims
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# 2024-04-17, 08:39:43 PM - nvm path
# register nvm dir to zsh
export NVM_DIR="$HOME/src/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ===== OMZ =================================== #

# OMZ settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dst"
plugins=()
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 60

# LOAD OMZ
source $ZSH/oh-my-zsh.sh
