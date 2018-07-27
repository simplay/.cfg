# Installation
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
#
# Path to your oh-my-zsh installation.
export ZSH=/home/simplay/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dracula"
PATH=~/bin:$PATH

source ~/.shell_secrets

# use git as the global CI editor
export VISUAL=vim
export EDITOR="$VISUAL"

if [ $XDG_CURRENT_DESKTOP="i3" ]; then
  XDG_CURRENT_DESKTOP="GNOME"
fi

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
# git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone git@github.com:rathrio/punch-zsh-completion.git ~/.oh-my-zsh/custom/plugins/punch

# echo "\nfpath=($HOME/.zsh/gradle-completion \$fpath)" >> ~/.zshrc

plugins=(git zsh.completions zsh-autosuggestions zsh-syntax-highlighting punch ssh-agent gradle-completion rails)
autoload -U compinit && compinit

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh
source ~/.custom_shell_scripts/transfer.sh
source ~/.custom_shell_scripts/tran.sh
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
export PATH=/~/bin/:$PATH

export EDITOR='vim'
export ECLIPSE_HOME='~/eclipse/'
export JRUBY_OPTS="--debug"



# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# %~   $PWD where $HOME is replaced by ~
autoload -U promptinit; promptinit

PROMPT='${ret_status} %{$fg[cyan]%}%~%{$reset_color%} $(git_prompt_info)'
PROMPT=''
prompt pure



# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
alias gs="git status"
#alias open="nautilus > /dev/null 2>&1"
alias open="thunar >/dev/null 2>&1"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ag='command ag'
alias gtags="ctags -R --c++-kinds=+p --fields=+liaS --extra=+q ."
alias ls='ls --color=auto'
alias ecm='cd eclipse && ./eclimd'
# find files/directory in current PWD with given name
alias f0="find . -maxdepth 1 -name "
alias nautilus="nautilus --no-desktop >/dev/null 2>&1 &"
alias mount_o="sudo mount -t cifs -o username=${AD_USER},password=${AD_PW},uid=1000,gid=1000,dir_mode=0700,file_mode=0600,nounix //dc2012/swissdrg$/ /mnt/swissdrg/"
alias punch="/home/simplay/repos/punch/punch.rb"
alias restart_wifi="sudo service network-manager restart; sleep 3; sudo service network-manager restart"
alias mapr="cd ~/repos/manual_printer"
alias mapi="cd ~/repos/workspace"
alias nedali="cd ~/repos/nedali"

# shortcuts
alias gopm="cd ~/repos/manual_printer/"
alias lm="ruby ~/repos/lazyman/lazyman.rb"
alias vpn="sudo openvpn /etc/openvpn/client.ovpn"

LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
