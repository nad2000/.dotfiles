# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
  #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vim='nvim'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#if [ -f ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
#    source ~/.local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
#    export PATH="$HOME/.local/bin:$PATH"
#    export POWERLINE_COMMAND=powerline
#    export POWERLINE_CONFIG_COMMAND=powerline-config
#    powerline-daemon -q
#    POWERLINE_BASH_CONTINUATION=1
#    POWERLINE_BASH_SELECT=1
#fi
[ -d $HOME/.local ] && PATH=$HOME/.local/bin:$PATH

## export sudo apt-get install most
hash most 2>/dev/null || export PAGER="most"

## GO:
export GOPATH=$HOME/work
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

[ -s "/home/nad2000/.dnx/dnvm/dnvm.sh" ] && . "/home/nad2000/.dnx/dnvm/dnvm.sh" # Load dnvm


## Android Studio:
export ANDROID_HOME=~/Android/Sdk
export ANDROID_STUDIO
if [ -d $ANDROID_HOME ] ; then
  PATH=${PATH}:${ANDROID_HOME}/tools
fi
[ -d ~/android-studio/jre/bin ] && PATH=~/android-studio/jre/bin:$PATH
[ -d ~/spark-2.0.1-bin-hadoop2.7 ] && PATH=~/spark-2.0.1-bin-hadoop2.7/bin:$PATH
[ -d $HOME/.cargo/bin ] && PATH=$HOME/.cargo/bin:$PATH

source <(kubectl completion bash)

# AWS completion:
[ -f aws_bash_completer ] && . aws_bash_completer

# Orcid Hub environments:
#ENV=dev
ENV=test
POSTGRES_PASSWORD=p455w0rd
POSTGRES_USER=orcidhub
PGPASSWORD=p455w0rd
PGUSER=orcidhub
#PGHOST=
PGDATABASE=orcidhub
ORCID_CLIENT_ID=APP-TF7LKIE084PYTQ59
ORCID_CLIENT_SECRET=bddcff36-8098-443a-bc5f-5cc18382f555
export POSTGRES_PASSWORD POSTGRES_USER PGPASSWORD PGDATABASE PGUSER
export ORCID_CLIENT_ID ORCID_CLIENT_SECRET ENV

export P12_PASSWORD=p455w0rd
export SHIB_SP_DOMAINNAME=${ENV}.orcidhub.org.nz
export SHIB_IDP_DOMAINNAME=directory.test.tuakiri.ac.nz
export METADATA_CERT_FILE=tuakiri-test-metadata-cert.pem
export TOKEN_PASSWORD_SALT=testsalt
export TOKEN_SECRET_KEY=testsecret
export MAIL_USERNAME=AKIAICSRSUE3LNBSIBVQ
export MAIL_PASSWORD=AqnVMLFc1+bZ9dnA6CDVZlGiltdP1je2Htv0wAwc6PH2
export MAIL_SERVER=email-smtp.us-east-1.amazonaws.com

## ORCID:
export ORCID_CLIENT_ID=APP-TF7LKIE084PYTQ59
export ORCID_CLIENT_SECRET=bddcff36-8098-443a-bc5f-5cc18382f555
export ENV=test
export POSTGRES_PASSWORD=p455w0rd

