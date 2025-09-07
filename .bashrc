#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias snvim='sudo -E nvim'
alias sppotify='spotify_player'

#PS1='[\u@\h \W]\$ '
PS1="\[\e[31m\][\u@\h \W]\[$\e[0m\] "
# Java JDK 21
export JAVA_HOME=/usr/lib/jvm/jdk-21
export PATH="$JAVA_HOME/bin:$PATH"

# Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"

