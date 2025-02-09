# ---  Personal aliases

# Alias to access dotfiles
alias dotfiles="cd $DOTFILES"

writescript-alias() {
  touch "$DOTFILES"/scripts/"$@"
  chmod +x "$DOTFILES"/scripts/"$@"
  subl "$DOTFILES"/scripts/"$@"
}

alias newscript=writescript-alias

# Trash-cli aliases
alias delete='trash-put'
alias clear-trash='trash-empty'
alias restore='trash-restore'
alias force-delete='trash-rm'
alias rm='echo "Use trash-put instead. Temporarily disable the alias if rm is necessary"; false'

# --- Ansible personal aliases

ansible-playbook-alias() {
  ansible-playbook $HOME/playbooks/playbooks/"$@"
}

playbook-syntax-check-alias() {
  ansible-playbook --syntax-check $HOME/playbooks/playbooks/"$@"
}

alias ansibleplay="ansible-playbook-alias"
alias ansiblecheck="playbook-syntax-check-alias"

# --- Git personal aliases

alias commitchanges="git add -A && git commit"
alias ch="git add -A && git commit"
alias amendlatest="git add -A && git commit --amend --no-edit"

# --- WordPress Assist Tools

alias makethemejson="cat theme.yaml | yq e -o json > theme.json"
alias makethemeyaml="yq -Poy theme.json > theme.yaml"

# --- Project Assist Tools

alias addassets="ln -s $HOME/lib/assets ./assets"

# --- Carryover settings from repo

# ALIASES ---------------------------------------------------------------------
alias unmount_all_and_exit='unmount_all && exit'
alias d=docker
alias dc=docker-compose
alias dkill="pgrep \"Docker\" | xargs kill -9"
alias hcat='highlight -O ansi'

alias v='nvim -w ~/.vimlog "$@"'
alias vi='nvim -w ~/.vimlog "$@"'
alias vim='nvim -w ~/.vimlog "$@"'

alias l='exa -lah'
alias ls=exa
alias sl=exa
alias c='clear'
alias s='source ~/.zshrc'
alias jj='pbpaste | jsonpp | pbcopy'
alias trim="awk '{\$1=\$1;print}'"

# GIT ALIASES -----------------------------------------------------------------
alias gc='git commit'
alias gco='git checkout'
alias ga='git add'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch -D'
alias gcp='git cherry-pick'
alias gd='git diff -w'
alias gds='git diff -w --staged'
alias grs='git restore --staged'
alias gst='git rev-parse --git-dir > /dev/null 2>&1 && git status || exa'
alias gu='git reset --soft HEAD~1'
alias gpr='git remote prune origin'
alias ff='gpr && git pull --ff-only'
alias grd='git fetch origin && git rebase origin/master'
alias gbb='git-switchbranch'
alias gbf='git branch | head -1 | xargs' # top branch
alias gl=pretty_git_log
alias gla=pretty_git_log_all
#alias gl="git log --graph --format=format:'%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(green)%an %ar %C(reset) %C(bold magenta)%d%C(reset)'"
#alias gla="git log --all --graph --format=format:'%C(bold blue)%h%C(reset) - %C(white)%s%C(reset) %C(bold magenta)%d%C(reset)'"
alias git-current-branch="git branch | grep \* | cut -d ' ' -f2"
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias gec='git status | grep "both modified:" | cut -d ":" -f 2 | trim | xargs nvim -'
alias gcan='gc --amend --no-edit'

alias gp="script -q /dev/null git push -u 2>&1 | tee >(cat) | grep \"pull/new\" | awk '{print \$2}' | xargs open"
alias gpf='git push --force-with-lease'

alias gbdd='git-branch-utils -d'
alias gbuu='git-branch-utils -u'
alias gbrr='git-branch-utils -r -b develop'
alias gg='git branch | fzf | xargs git checkout'
alias gup='git branch --set-upstream-to=origin/$(git-current-branch) $(git-current-branch)'

alias gnext='git log --ancestry-path --format=%H ${commit}..master | tail -1 | xargs git checkout'
alias gprev='git checkout HEAD^'

# FUNCTIONS -------------------------------------------------------------------
# function gg {
#     git branch | grep "$1" | head -1 | xargs git checkout
# }

function take {
    mkdir -p $1
    cd $1
}

note() {
    echo "date: $(date)" >> $HOME/drafts.txt
    echo "$@" >> $HOME/drafts.txt
    echo "" >> $HOME/drafts.txt
}

function unmount_all {
    diskutil list |
    grep external |
    cut -d ' ' -f 1 |
    while read file
    do
        diskutil unmountDisk "$file"
    done
}

mff ()
{
    local curr_branch=`git-current-branch`
    gco master
    ff
    gco $curr_branch
}

JOBFILE="$DOTFILES/job-specific.sh"
if [ -f "$JOBFILE" ]; then
    source "$JOBFILE"
fi

dclear () {
    docker ps -a -q | xargs docker kill -f
    docker ps -a -q | xargs docker rm -f
    docker images | grep "api\|none" | awk '{print $3}' | xargs docker rmi -f
    docker volume prune -f
}

alias docker-clear=dclear

dreset () {
    dclear
    docker images -q | xargs docker rmi -f
    docker volume rm $(docker volume ls |awk '{print $2}')
    rm -rf ~/Library/Containers/com.docker.docker/Data/*
    docker system prune -a
}

extract-audio-and-video () {
    ffmpeg -i "$1" -c:a copy obs-audio.aac
    ffmpeg -i "$1" -c:v copy obs-video.mp4
}

alias epdir='cd `epdir.sh`'


hs () {
 curl https://httpstat.us/$1
}

copy-line () {
  rg --line-number "${1:-.}" | sk --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print $3}' | sed 's/^\s+//' | pbcopy
}

open-at-line () {
  vim $(rg --line-number "${1:-.}" | sk --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{print "+"$2" "$1}')
}

