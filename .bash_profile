#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

dockerd-rootless.sh
dbus-run-session start-hyprland
