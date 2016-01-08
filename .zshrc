# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [ -d $ZSH ]; then
    # Uncomment the following line to use case-sensitive completion.
    CASE_SENSITIVE="true"

    # Uncomment the following line to disable bi-weekly auto-update checks.
    DISABLE_AUTO_UPDATE="true"

    # Uncomment the following line to change how often to auto-update (in days).
    # export UPDATE_ZSH_DAYS=13

    # Uncomment the following line to disable colors in ls.
    # DISABLE_LS_COLORS="true"

    # Uncomment the following line to disable auto-setting terminal title.
    # DISABLE_AUTO_TITLE="true"

    # Uncomment the following line to enable command auto-correction.
    # ENABLE_CORRECTION="true"

    # Uncomment the following line to display red dots whilst waiting for completion.
    COMPLETION_WAITING_DOTS="true"

    # Uncomment the following line if you want to disable marking untracked files
    # under VCS as dirty. This makes repository status check for large repositories
    # much, much faster.
    DISABLE_UNTRACKED_FILES_DIRTY="true"

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
    plugins=(history-substring-search)

    source $ZSH/oh-my-zsh.sh
else
    alias ls='ls -GF --color=auto'

    # http://stackoverflow.com/a/2534676
    autoload -U colors && colors
    PS1="%{$fg[yellow]%}%~ %{$reset_color%}% "

    # allow 'foo' instead of 'cd foo'.
    setopt auto_cd
fi

# User configuration

export PATH=$PATH:~/bin:~/.cabal/bin:~/.cask/bin
export PATH=$PATH:/usr/local/heroku/bin
export PATH=$PATH:~/.gem/ruby/2.2.0/bin
export PATH="$PATH":~/.multirust/toolchains/nightly/cargo/bin

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR=zile

export MYSQL_PS1="\u@\h:mysql> "
alias mysql-color="rlwrap --always-readline --prompt-colour=GREEN mysql"

alias sst='svn status'
alias gst='git status'

# quieten gdb's verbose startup
alias gdb="gdb -q"

alias open="xdg-open"

alias apt-install="sudo apt-get install"
apt-search () { apt-cache search $* | less }


# less colours -- since man uses less as a pager, this gives us
# coloured man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# share history between terminals, from http://askubuntu.com/q/23630
setopt inc_append_history
setopt share_history

if hash fasd 2>/dev/null; then
    # fasd provides directory jumping with 'z'
    eval "$(fasd --init auto)"
fi

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    # virtualenvwrapper configuration
    export WORKON_HOME=$HOME/.envs
    source /usr/bin/virtualenvwrapper.sh
fi

# Don't use cowsay with ansible
export ANSIBLE_NOCOWS=1
