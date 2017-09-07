# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/rcir178/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="zenburn"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

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
# Orcid Hub environments:
ENV=dev
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
export BACKUP_DATABASE_URL=postgresql://orcidhub:p455w0rd@backup.orcidhub.org.nz:5432/orcidhub
export SECRET_KEY=f5e95a2e69e61e0891d58c831125533ab514ef58590b1c52bd5cb7d1
export OAUTHLIB_INSECURE_TRANSPORT=1
export ORCID_CLIENT_ID=APP-42W3G8FS4OHGM562
export ORCID_CLIENT_SECRET=f6a1088a-b8d9-4e3a-992b-ab4a583782b5
export SHIB_METADATA_PROVIDER_URI=https://directory.test.tuakiri.ac.nz/metadata/tuakiri-test-metadata-signed.xml

