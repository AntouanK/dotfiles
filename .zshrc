export ZSH=/home/antouank/.oh-my-zsh
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="dieter"
#ZSH_THEME="bureau"
# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1
# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
source $ZSH/oh-my-zsh.sh
# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export "PKG_CONFIG=/usr/bin/pkg-config"
# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\e[0m'           # end mode
export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\e[0m'           # end underline
export LESS_TERMCAP_us=$'\e[04;38;5;146m' # begin underline
# add the .npm-global binaries in the PATH
export PATH="$(echo ~/.npm-global/bin):$PATH"
export EDITOR=vim
export BROWSER=/usr/bin/vivaldi-stable

setopt extended_glob

###################
# aliases
alias ls='ls --color -lahG'
# grep with color
alias grep='grep --color=auto'
# my ip
alias realip='curl curlmyip.com'
# git status
alias st='git status -s'
#git log
alias glog='git log --pretty=oneline --graph --all'
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

# git
alias gdiff='git diff --color | diff-so-fancy | less'
# ping
alias ping_google="ping google.com -c 1 | grep time= | sed 's/.*time\=//g'"
# arch update all
alias yupdate="yaourt -Syyu --devel --aur"
# on terminal session start
screenfetch

alias shutdown

alias make-build-watch="make build && while inotifywait -e close_write ./src/**/*; do clear && make build ; done"

alias vpnStart="sudo systemctl start openvpn-client@de-1-vultr.service"
alias vpnStop="sudo systemctl stop openvpn-client@de-1-vultr.service"
