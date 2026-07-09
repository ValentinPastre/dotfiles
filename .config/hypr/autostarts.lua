local p = require("programs")

hl.on("hyprland.start", function()
	hl.exec_cmd("gentoo-pipewire-launcher restart")
	hl.exec_cmd(p.statusBar)
	-- Para systemd -- hl.exec_cmd("systemctl --user start hyprpolkitagent")
	-- hl.exec_cmd("hyprpaper")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("bluetoothctl power off")
	hl.exec_cmd("mako")

	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("~/.config/hypr/scripts/xdg-portal-hyprland.sh")
	hl.exec_cmd("/usr/libexec/hyprpolkitagent")

	hl.exec_cmd("sleep 1.5 && hyprctl reload")
end)
