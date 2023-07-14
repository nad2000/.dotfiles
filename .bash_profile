#
# ~/.bash_profile
#
# See more: https://unix.stackexchange.com/questions/320465/new-tmux-sessions-do-not-source-bashrc-file/541352#541352
# https://github.com/pyenv/pyenv/wiki/Unix-shell-initialization
# https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html

[ -n "$BASH_VERSION" -a -n "$PS1" -a  -f ~/.bashrc ] && . ~/.bashrc
alias please=sudo

# Source the git bash completion file
if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
    # GIT_PS1_SHOWDIRTYSTATE=true
    # GIT_PS1_SHOWSTASHSTATE=true
    # GIT_PS1_SHOWUPSTREAM="auto"
    # PS1='\t:\[\033[32m\]$(__git_ps1 " (%s)")\[\033[00m\] \W$ '
fi

[ -f ~/.git-prompt.sh ] && source ~/.git-prompt.sh
