#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Usage: $0 --title | --arturl | --artist | --length | --album | --source"
	exit 1
fi

# Function to get metadata using playerctl
get_metadata() {
	key=$1
	playerctl metadata --format "{{ $key }}" 2>/dev/null
}

# Check for arguments

# Function to determine the source and return an icon and text

get_source_info() {
	# Buscar un player que esté reproduciendo activamente
	player=$(playerctl --list-all | while read -r p; do
		status=$(playerctl --player="$p" status 2>/dev/null)
		if [[ "$status" == "Playing" ]]; then
			echo "$p"
			break
		fi
	done)

	# Si no hay ninguno reproduciendo, usar el primero disponible
	if [ -z "$player" ]; then
		player=$(playerctl -l | head -n 1)
	fi

	case "$player" in
		spotify) echo "Spotify" ;;
		spotify_player) echo "Spotify" ;;
		*firefox*) echo "Firefox" ;;
		*chromium*) echo "Chrome" ;;
		*) echo "" ;;
	esac
}


# Parse the argument
case "$1" in
--title)
	title=$(get_metadata "xesam:title")
	if [ -z "$title" ]; then
		echo ""
	else
		echo "${title:0:28}" # Limit the output to 50 characters
	fi
	;;
--arturl)
	url=$(get_metadata "mpris:artUrl")
	if [ -z "$url" ]; then
		echo ""
	else
		if [[ "$url" == file://* ]]; then
			url=${url#file://}
		fi
		echo "$url"
	fi
	;;
--artist)
	artist=$(get_metadata "xesam:artist")
	if [ -z "$artist" ]; then
		echo ""
	else
		echo "${artist:0:30}" # Limit the output to 50 characters
	fi
	;;
--length)
	length=$(get_metadata "mpris:length")
	if [ -z "$length" || "$length" -eq 0 ]; then
		echo ""
	else
		# Convert length from microseconds to a more readable format (seconds)
		total_seconds=$((length / 1000000))
		minutes=$((total_seconds / 60))
		seconds=$((total_seconds % 60))
		printf "%d:%02d" "$minutes" "$seconds"
	fi
	;;
--status)
	status=$(playerctl status 2>/dev/null)
	if [[ $status == "Playing" ]]; then
		echo "Playing"
	elif [[ $status == "Paused" ]]; then
		echo "Paused"
	else
		echo ""
	fi
	;;
--album)
	album=$(playerctl metadata --format "{{ xesam:album }}" 2>/dev/null)
	if [[ -n $album ]]; then
		echo "$album"
	else
		status=$(playerctl status 2>/dev/null)
		if [[ -n $status ]]; then
			echo "Not album"
		else
			echo ""
		fi
	fi
	;;
--source)
	get_source_info
	;;
*)
	echo "Invalid option: $1"
	echo "Usage: $0 --title | --url | --artist | --length | --album | --source"
	exit 1
	;;
esac
