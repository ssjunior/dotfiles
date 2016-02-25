# load zgen
source "${HOME}/zgen/zgen.zsh"

# vi style binding
# bindkey -v

source /usr/local/bin/virtualenvwrapper.sh
# source ~/.tmuxinator/bin/tmuxinator.zsh

export WORKON_HOME=~/Dev/Envs
export EDITOR='vim'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

alias python2="python"
alias r='ranger'
alias vi='vim'
alias mkvirtualenv2='mkvirtualenv --python=python2'

HIST_STAMPS="dd/mm/yyyy"

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# User configuration
# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
source /usr/local/opt/autoenv/activate.sh

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/autojump
    zgen oh-my-zsh plugins/autoenv
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/pip
    zgen oh-my-zsh plugins/virtualenvwrapper
    zgen oh-my-zsh plugins/git-flow
    zgen oh-my-zsh plugins/git-extras
    zgen oh-my-zsh plugins/celery
    zgen oh-my-zsh plugins/bower
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting         
#     zgen load /path/to/super-secret-private-plugin

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/robbyrussell
    # zgen load /Users/ssjunior/.oh-my-zsh/themes/ssjunior

    # save all to init script
    zgen save
fi
