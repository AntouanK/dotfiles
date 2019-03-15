# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# use oh-my-zsh theme
ZSH_THEME="cypher"

# Path to your oh-my-zsh installation.
export ZSH=/home/antouank/.oh-my-zsh

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=3

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git, zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export "PKG_CONFIG=/usr/bin/pkg-config"

export EDITOR='nvim'

export PATH="/bin:/home/antouank/.local/bin:/home/antouank/.npm-packages/bin:/home/antouank/.cabal/bin:$PATH"
export BROWSER=/usr/bin/firefox

export MAKEFLAGS="-j 8"

# pure theme
# https://github.com/sindresorhus/pure
#autoload -U promptinit; promptinit
#prompt pure

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# on terminal session start
neofetch

# some "help" text
function echo_color() {
  local color="$1"
  printf "${color}$2\033[0m\n"
}
function help-zsh() {
    local dark_grey="\033[0;90m"
    echo_color ${dark_grey} "c-f  Move forward"
    echo_color ${dark_grey} "c-b  Move backward"
    echo_color ${dark_grey} "c-p  Move up"
    echo_color ${dark_grey} "c-n  Move down"
    echo_color ${dark_grey} "c-a  Jump to beginning of line"
    echo_color ${dark_grey} "c-e  Jump to end of line"
    echo_color ${dark_grey} "c-d  Delete forward"
    echo_color ${dark_grey} "c-h  Delete backward"
    echo_color ${dark_grey} "c-k  Delete forward to end of line"
    echo_color ${dark_grey} "c-u  Delete entire line"

    echo_color ${dark_grey} ___alias___
    grep "alias " ~/.zshrc

}

function gitcommit() {
    git add . && git commit -m $1 && git push -u origin $(git rev-parse --abbrev-ref HEAD)
}

###################
# aliases
alias ls='ls --color -lahG'
# grep with color
alias grep='grep --color=auto'
# my ip
alias realip='curl curlmyip.com'
# git
alias gdevpull='git checkout develop && git pull'
alias gdelorphans='git branch -vv | grep '"': gone]'"' | awk '"'"'{print $1}'"'"' | xargs -n 1 git branch -d'
alias st='git status -s'
alias glog='git log --oneline --graph --all'
# see size of directory
alias sizeof='du -sh'
# docker
alias dps='docker ps -a'
alias dpsf='docker ps -a --format "table {{.Image}}\t{{.Status}}\t{{.Names}}\t{{.Ports}}"'
alias drm='docker rm'
alias dlogs='docker logs'
alias dcup='docker-compose up -d'
alias dclogs='docker-compose logs'
alias dstats='docker ps -a --format "table {{.Names}}" | grep -v "NAMES" | xargs docker stats'
alias dcbuildup='docker-compose build && dcup && dclogs -f'
alias dcstoprm='docker-compose stop && docker-compose rm -f'
alias dcd='docker-compose -f docker-compose.dev.yml'
alias dsls='docker stack ls'
alias dsps='docker stack ps'
alias dsrm='docker stack rm'
alias dsservices='docker stack services'
alias dsdeploy='docker stack deploy'
# ping
alias ping_google="ping google.com -c 1 | grep time= | sed 's/.*time\=//g'"
# arch update all
alias yay="yay --color=auto"
alias yupdate="yay -Syyu --color=auto"
alias xclip="xclip -selection c"

alias mosh-garage="mosh -ssh=\"ssh -p 11022\" crazy.homeip.net -p 11170:11175 tmux"
alias mosh-styx="mosh -ssh=\"ssh -p 12022\" crazy.homeip.net -p 12170:12175 tmux"

peek() { tmux split-window -p 33 $EDITOR $@ || exit; }

export TERM=xterm-256color

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /run/media/antouank/evo1/_REPOS_/_elsewhen_/se-graphql/node_modules/tabtab/.completions/serverless.zsh ]] && . /run/media/antouank/evo1/_REPOS_/_elsewhen_/se-graphql/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /run/media/antouank/evo1/_REPOS_/_elsewhen_/se-graphql/node_modules/tabtab/.completions/sls.zsh ]] && . /run/media/antouank/evo1/_REPOS_/_elsewhen_/se-graphql/node_modules/tabtab/.completions/sls.zsh
