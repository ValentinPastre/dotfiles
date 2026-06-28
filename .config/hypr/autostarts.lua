local p = require("programs")

hl.on("hyprland.start", function()
	hl.exec_cmd(p.statusBar)
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("bluetoothctl power off")
	hl.exec_cmd("mako")
	hl.exec_cmd("$HOME/.config/hypr/scripts/battery_threshold_notification.sh")

	hl.exec_cmd("sleep 1.5 && hyprctl reload")
end)
