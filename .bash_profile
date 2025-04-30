#
# ~/.bash_profile
#
# See more: https://unix.stackexchange.com/questions/320465/new-tmux-sessions-do-not-source-bashrc-file/541352#541352
# https://github.com/pyenv/pyenv/wiki/Unix-shell-initialization
# https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html

[ -n "$BASH_VERSION" -a -n "$PS1" -a  -f ~/.bashrc ] && . ~/.bashrc
alias please=sudo

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
