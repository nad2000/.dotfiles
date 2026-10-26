[ -d "$HOME/bin" ] && [[ "$PATH" == *"$HOME/bin"* ]] || PATH="$HOME/bin:$PATH"
[ -d "$HOME/.local/bin" ] && [[ "$PATH" == *"$HOME/.local/bin"* ]] || PATH="$HOME/.local/bin:$PATH"
[ -d /usr/local/bin ] && [[ "$PATH" == *"/usr/local/bin"* ]] || PATH="/usr/local/bin:$PATH"

## Local NVIM build:
if [ -d "$HOME/nvim-linux-x86_64/bin" ] && [[ "$PATH" != *"$HOME/nvim-linux-x86_64/bin"* ]] ; then
	PATH="$HOME/nvim-linux-x86_64/bin:$PATH"
fi

if [ -z "$NVM_DIR" ] ; then
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

SH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="zenburn"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)
export LANG=en_NZ.UTF-8

# Preferred editor for local and remote sessions
if which nvim &>/dev/null ; then
	export EDITOR='nvim'
	export MANPAGER="nvim --cmd 'let is_view=1' -c 'set ft=man ts=8 nomod nolist nonu noma' -c 'map <space> <c-d>' +Man!"
else
	export EDITOR='vim'
	if which batcat &>/dev/null ; then
		export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
	fi
fi

which batcat &>/dev/null && export PAGER="batcat --paging=always" || \
  which bat &>/dev/null && export PAGER="bat --paging=always" || \
  which most &>/dev/null && export PAGER="most" || export PAGER="less"

# Orcid Hub environments:
ENV=dev0
#ENV=test
# POSTGRES_PASSWORD=<...>
# POSTGRES_USER=<...>
# PGPASSWORD=<...>
# PGUSER=<...>
#PGHOST=
PGDATABASE=orcidhub
export POSTGRES_PASSWORD POSTGRES_USER PGPASSWORD PGDATABASE PGUSER ENV

# export P12_PASSWORD=<...>
export SHIB_SP_DOMAINNAME=${ENV}.orcidhub.org.nz
export SHIB_IDP_DOMAINNAME=directory.test.tuakiri.ac.nz
export METADATA_CERT_FILE=tuakiri-test-metadata-cert.pem
export TOKEN_PASSWORD_SALT=testsalt
export TOKEN_SECRET_KEY=testsecret

#export MAIL_DEFAULT_SENDER=no-reply@orcidhub.org.nz
#export MAIL_PASSWORD=<...>
#export MAIL_SERVER=email-smtp.us-east-1.amazonaws.com
#export MAIL_USERNAME=AKIAISUVN4HBEQK6VRIA

export MAIL_SERVER=dev.orcidhub.org.nz
export MAIL_PORT=2525

export USER_UID=$(id -u)
export USER_GID=$(id -g)
# export BACKUP_DATABASE_URL=postgresql://orcidhub:p455w0rd@backup.orcidhub.org.nz:5432/orcidhub
export SECRET_KEY=f5e95a2e69e61e0891d58c831125533ab514ef58590b1c52bd5cb7d1
export OAUTHLIB_INSECURE_TRANSPORT=1
# export ORCID_CLIENT_ID=APP-42W3G8FS4OHGM562
# export ORCID_CLIENT_SECRET=f6a1088a-b8d9-4e3a-992b-ab4a583782b5
export ORCID_CLIENT_ID=APP-6DZOOMOKJCYRY6GE
export ORCID_CLIENT_SECRET=f7a2d69a-b3f9-4988-8772-160db671d814
export SHIB_METADATA_PROVIDER_URI=https://directory.test.tuakiri.ac.nz/metadata/tuakiri-test-metadata-signed.xml
# export SENTRY_DSN=https://bec5d4a546aa43e7b01b82d43751990e:ab4cc99df77143718ee9d44d6c19ee5e@sentry.io/226636
export SENTRY_DSN="https://ca6ff8cc0e2248068d84643686a763d1@sentry.io/5188371"
# export DATABASE_URL=postgresql://dev.orcidhub.org.nz:5432/orcidhub
export DATABASE_URL='mysql://root:p455w0rd@/blocks?parseTime=true'
export EXTERNAL_SP=https://dev.orcidhub.org.nz/Tuakiri/SP
export FLASK_APP=orcid_hub
export FLASK_ENV=development

## GO:
# To install Go inside your user home directory on Linux (which is ideal if you do not have root/sudo privileges or want to keep the installation isolated), you need to extract it into a custom folder like $HOME/.local/go or $HOME/go-dist.
# Avoid extracting it directly to $HOME/go, as that is the default workspace location where Go downloads third-party packages (GOPATH), and nesting them will cause errors.
if [ -d ~/.local/go -a -z "$GOPATH" ] ; then
	export GOROOT=$HOME/.local/go
	export GOPATH=$HOME/go
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# $HOME/.local/share/gem/ruby/3.0.0/bin
[ -d $HOME/.local/share/gem/ruby/3.0.0/bin ] && export PATH=$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin

export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# Get default LARBS WM from ~/.local/share/larbs/wm
export LARBSWM="$(cat ~/.local/share/larbs/wm 2>/dev/null)" &&
	[ "$LARBSWM" = "dwm" ] || export LARBSWM="i3"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="/usr/bin/brave"
# export READER="zathura"
export FILE="nnn"
# export STATUSBAR="${LARBSWM}blocks"

# # ~/ Clean-up:
# export NOTMUCH_CONFIG="$HOME/.config/notmuch-config"
# # export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc-2.0"
# export LESSHISTFILE="-"
# # export INPUTRC="$HOME/.config/inputrc"
# export ZDOTDIR="$HOME/.config/zsh"
# export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"

# # Other program settings:
# # export DICS="/usr/share/stardict/dic/"
# # export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
# # export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
# export LESS=-R
# export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
# export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
# export LESS_TERMCAP_me="$(printf '%b' '[0m')"
# export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
# export LESS_TERMCAP_se="$(printf '%b' '[0m')"
# export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
# export LESS_TERMCAP_ue="$(printf '%b' '[0m')"

# # # Switch escape and caps if tty and no passwd required:
# # sudo -n loadkeys ~/.local/share/larbs/ttymaps.kmap 2>/dev/null

# export LF_ICONS="di=:fi=:ln=:or=:ex=:*.c=:*.cc=:*.clj=:*.coffee=:*.cpp=:*.css=:*.d=:*.dart=:*.erl=:*.exs=:*.fs=:*.go=:*.h=:*.hh=:*.hpp=:*.hs=:*.html=:*.java=:*.jl=:*.js=:*.json=:*.lua=:*.md=:*.php=:*.pl=:*.pro=:*.py=:*.rb=:*.rs=:*.scala=:*.ts=:*.vim=:*.cmd=:*.ps1=:*.sh=:*.bash=:*.zsh=:*.fish=:*.tar=:*.tgz=:*.arc=:*.arj=:*.taz=:*.lha=:*.lz4=:*.lzh=:*.lzma=:*.tlz=:*.txz=:*.tzo=:*.t7z=:*.zip=:*.z=:*.dz=:*.gz=:*.lrz=:*.lz=:*.lzo=:*.xz=:*.zst=:*.tzst=:*.bz2=:*.bz=:*.tbz=:*.tbz2=:*.tz=:*.deb=:*.rpm=:*.jar=:*.war=:*.ear=:*.sar=:*.rar=:*.alz=:*.ace=:*.zoo=:*.cpio=:*.7z=:*.rz=:*.cab=:*.wim=:*.swm=:*.dwm=:*.esd=:*.jpg=:*.jpeg=:*.mjpg=:*.mjpeg=:*.gif=:*.bmp=:*.pbm=:*.pgm=:*.ppm=:*.tga=:*.xbm=:*.xpm=:*.tif=:*.tiff=:*.png=:*.svg=:*.svgz=:*.mng=:*.pcx=:*.mov=:*.mpg=:*.mpeg=:*.m2v=:*.mkv=:*.webm=:*.ogm=:*.mp4=:*.m4v=:*.mp4v=:*.vob=:*.qt=:*.nuv=:*.wmv=:*.asf=:*.rm=:*.rmvb=:*.flc=:*.avi=:*.fli=:*.flv=:*.gl=:*.dl=:*.xcf=:*.xwd=:*.yuv=:*.cgm=:*.emf=:*.ogv=:*.ogx=:*.aac=:*.au=:*.flac=:*.m4a=:*.mid=:*.midi=:*.mka=:*.mp3=:*.mpc=:*.ogg=:*.ra=:*.wav=:*.oga=:*.opus=:*.spx=:*.xspf=:*.pdf="

# Fcitx: https://wiki.archlinux.org/title/Fcitx#Set_environment_variables_for_IM_modules
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS='@im=fcitx'

[ -f "$HOME/.luarocks/bin" ] && export PATH=$HOME/.luarocks/bin:$PATH

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

[ -d '/var/lib/flatpak/exports/share' ] && XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
[ -d "$HOME/.local/share/flatpak/exports/share" ] && XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:$XDG_DATA_DIRS"
export XDG_DATA_DIRS
