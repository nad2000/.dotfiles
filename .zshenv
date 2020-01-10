export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
SH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="zenburn"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git)
export LANG=en_NZ.UTF-8

# Preferred editor for local and remote sessions
if which nvim &>/dev/null ; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Orcid Hub environments:
ENV=dev0
#ENV=test
POSTGRES_PASSWORD=p455w0rd
POSTGRES_USER=orcidhub
PGPASSWORD=p455w0rd
PGUSER=orcidhub
#PGHOST=
PGDATABASE=orcidhub
export POSTGRES_PASSWORD POSTGRES_USER PGPASSWORD PGDATABASE PGUSER ENV

export P12_PASSWORD=p455w0rd
export SHIB_SP_DOMAINNAME=${ENV}.orcidhub.org.nz
export SHIB_IDP_DOMAINNAME=directory.test.tuakiri.ac.nz
export METADATA_CERT_FILE=tuakiri-test-metadata-cert.pem
export TOKEN_PASSWORD_SALT=testsalt
export TOKEN_SECRET_KEY=testsecret

#export MAIL_DEFAULT_SENDER=no-reply@orcidhub.org.nz
#export MAIL_PASSWORD=AgPDjD2UUs7O7Qg7YZxYXnMyl5Rjg6j0/6mgHz4NOQkr
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
export SENTRY_DSN=https://bec5d4a546aa43e7b01b82d43751990e:ab4cc99df77143718ee9d44d6c19ee5e@sentry.io/226636
# export DATABASE_URL=postgresql://dev.orcidhub.org.nz:5432/orcidhub
export DATABASE_URL='mysql://root:p455w0rd@/blocks?parseTime=true'
export EXTERNAL_SP=https://dev.orcidhub.org.nz/Tuakiri/SP
export FLASK_APP=orcid_hub
export FLASK_ENV=development

## GO:
export GOPATH=$HOME
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export BROWSER=chromium

# Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Get default LARBS WM from ~/.local/share/larbs/wm
export LARBSWM="$(cat ~/.local/share/larbs/wm 2>/dev/null)" &&
	[ "$LARBSWM" = "dwm" ] || export LARBSWM="i3"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="chromium"
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
