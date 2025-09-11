#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias sppotify='spotify_player'

#PS1='[\u@\h \W]\$ '
PS1="\[\e[31m\][\u@\h \W]\$ \[\e[0m\]"
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
export PATH="$JAVA_HOME/:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

#HACER sudoedit PARA EDITAR ARCHIVOS DE ROOT
export VISUAL=nvim
export EDITOR=nvim

