local programs = {
	terminal = "kitty",
	fileManager = "thunar",
	menu = "rofi -config ~/.config/rofi/gruvbox-config.rasi -show drun",
	webBrowser = "firefox",
	music = "kitty spotify_player",
	statusBar = "waybar -c ~/.config/waybar/gruvbox-config.json -s ~/.config/waybar/gruvbox-style.css",
	logoutMenu = "wlogout --css ~/.config/wlogout/gruvbox-style.css -b 6 -T 325 -B 325",
}

return programs
