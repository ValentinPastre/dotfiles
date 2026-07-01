# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias sppotify='spotify_player'

alias poweroff='loginctl poweroff'
alias reboot='loginctl reboot'
alias suspend='loginctl suspend'
alias hibernate='loginctl hibernate'

#PS1='[\u@\h \W]\$ '
PS1="\[\e[31m\][\u@\h \W]\$ \[\e[0m\]"

#HACER sudoedit PARA EDITAR ARCHIVOS DE ROOT
export VISUAL=nvim
export EDITOR=nvim
export DIFFPROG="nvim -d"

############################## LENGUAJES PROGRAMACION ##############################

# JAVA_HOME para arch linux
# export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

# JAVA_HOME para gentoo linux
export JAVA_HOME=/usr/lib/jvm/openjdk-bin-21
export PATH="$JAVA_HOME/bin:$PATH"
export GRADLE_HOME=/opt/gradle/gradle-9.6.1
export PATH="$GRADLE_HOME/bin:$PATH"

# Path para arch linux
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"

export NPM_CONFIG_PREFIX="$HOME/.local/"

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"


source ~/.git-completion.bash
