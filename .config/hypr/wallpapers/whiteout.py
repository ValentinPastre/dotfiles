#!/usr/bin/env python3

# ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓████████▓▒░▒▓████████▓▒░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░ 
# ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░     
# ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░     
# ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓████████▓▒░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓██████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░     
# ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░     
# ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░  ░▒▓█▓▒░     
#  ░▒▓█████████████▓▒░░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░  ░▒▓█▓▒░   ░▒▓████████▓▒░▒▓██████▓▒░ ░▒▓██████▓▒░   ░▒▓█▓▒░                                                                                                                                                                                                                     
#
#   Hyprland Wallpaper Manager
#
#   Author: Justin Bryson (Morvoso)
#   License: MIT License
#   Repo: https://github.com/morvoso/hyprland-whiteout
#

import os
import subprocess
import re

# --- Configuration ---
WALLPAPER_DIR = os.path.expanduser("~/.config/hypr/wallpapers/")
HYPRLAND_CONF = os.path.expanduser("~/.config/hypr/hyprland.conf")
HYPRPAPER_CONF = os.path.expanduser("~/.config/hypr/hyprpaper.conf")

def get_wallpapers():
    """Returns a list of wallpapers from the wallpaper directory."""
    if not os.path.exists(WALLPAPER_DIR):
        print(f"Wallpaper directory not found: {WALLPAPER_DIR}")
        return []
    
    supported_extensions = [".jpg", ".jpeg", ".png", ".gif"]
    wallpapers = []
    for filename in os.listdir(WALLPAPER_DIR):
        if any(filename.lower().endswith(ext) for ext in supported_extensions):
            wallpapers.append(os.path.join(WALLPAPER_DIR, filename))
    return wallpapers

def show_preview(image_path):
    """Muestra la imagen en kitty usando icat."""
    subprocess.run(["kitty", "+kitten", "icat", "--clear"])
    subprocess.run(["kitty", "+kitten", "icat", image_path])

import curses

def select_wallpaper(stdscr, wallpapers):
    """Presents an interactive menu to select a wallpaper."""
    curses.curs_set(0)

    curses.start_color()
    curses.use_default_colors()
    curses.init_pair(1, curses.COLOR_BLACK, curses.COLOR_MAGENTA)
    HIGHLIGHT_COLOR = curses.color_pair(1)

    current_row = 0
    start_row = 0
    height, width = stdscr.getmaxyx()
    max_visible = height
        
    while True:
        stdscr.clear()


        end_row = start_row + max_visible
        visible_items = wallpapers[start_row:end_row]


        for i, wallpaper in enumerate(visible_items):
            actual_i = start_row + i
            if actual_i == current_row:
                stdscr.addstr(i, 0, f"> {os.path.basename(wallpaper)}",HIGHLIGHT_COLOR)
            else:
                stdscr.addstr(i, 0, f"  {os.path.basename(wallpaper)}")
        stdscr.refresh()

        key = stdscr.getch()
        if key == curses.KEY_UP:
            if current_row > 0:
                current_row -= 1
                if current_row < start_row:
                    start_row -= 1
        elif key == curses.KEY_DOWN:
            if current_row < len(wallpapers) - 1:
                current_row += 1
                if current_row >= start_row + max_visible:
                    start_row += 1
        elif key == curses.KEY_ENTER or key in [10, 13]:
            return wallpapers[current_row]

def get_monitors():
    """Returns a list of monitor names."""
    try:
        result = subprocess.run(["hyprctl", "monitors"], check=True, capture_output=True, text=True)
        # The output of `hyprctl monitors` is a bit verbose, so we parse it to get the monitor names.
        # We're looking for lines like 'Monitor DP-1 (ID 0):'
        monitors = re.findall(r"Monitor (\S+)", result.stdout)
        return monitors
    except (subprocess.CalledProcessError, FileNotFoundError) as e:
        print(f"Error getting monitors: {e}")
        return []

def set_wallpaper(wallpaper_path):
    """Sets the wallpaper using hyprpaper."""
    monitors = get_monitors()
    if not monitors:
        print("No monitors found.")
        return

    try:
        # Unload all existing wallpapers for a clean slate
        print("Unloading all current wallpapers...")
        subprocess.run(["hyprctl", "hyprpaper", "unload", "all"], check=True, capture_output=True)

        # Preload the new wallpaper
        print(f"Preloading new wallpaper: {os.path.basename(wallpaper_path)}")
        subprocess.run(["hyprctl", "hyprpaper", "preload", wallpaper_path], check=True, capture_output=True)

        # Set the wallpaper for each monitor
        for monitor in monitors:
            print(f"Setting wallpaper for monitor: {monitor}")
            subprocess.run(["hyprctl", "hyprpaper", "wallpaper", f"{monitor},{wallpaper_path}"], check=True, capture_output=True)

        print("Wallpaper set successfully on all monitors.")
    except (subprocess.CalledProcessError, FileNotFoundError) as e:
        print(f"Error setting wallpaper: {e}")
        if isinstance(e, subprocess.CalledProcessError):
            print("Stderr:", e.stderr.decode())
        print("Please ensure 'hyprctl' is in your PATH and hyprpaper is running.")


def update_hyprpaper_conf(wallpaper_path):
    """Updates the hyprpaper.conf file by overwriting it."""
    monitors = get_monitors()
    if not os.path.exists(os.path.dirname(HYPRPAPER_CONF)):
        os.makedirs(os.path.dirname(HYPRPAPER_CONF))

    with open(HYPRPAPER_CONF, "w") as f:
        f.write(f"# Generated by whiteout\n")
        f.write(f"preload = {wallpaper_path}\n")
        if not monitors:
            # Fallback for when no monitors are found
            f.write(f"wallpaper = ,{wallpaper_path}\n")
        else:
            for monitor in monitors:
                f.write(f"wallpaper = {monitor},{wallpaper_path}\n")

    print("hyprpaper.conf updated.")


def update_hyprland_conf():
    """Ensures hyprland.conf has the exec-once for hyprpaper."""
    if not os.path.exists(HYPRLAND_CONF):
        print(f"hyprland.conf not found at: {HYPRLAND_CONF}")
        return

    try:
        with open(HYPRLAND_CONF, "r") as f:
            for line in f:
                if "exec-once = hyprpaper" in line and not line.strip().startswith("#"):
                    print("hyprland.conf is already set up.")
                    return
    except FileNotFoundError:
        print(f"hyprland.conf not found at: {HYPRLAND_CONF}")
        return


    with open(HYPRLAND_CONF, "a") as f:
        f.write("\n# Added by whiteout\nexec-once = hyprpaper\n")
    print("hyprland.conf updated to launch hyprpaper on startup.")


def main():
    """Main function."""
    update_hyprland_conf()

    wallpapers = get_wallpapers()
    if not wallpapers:
        print("No wallpapers found.")
        return

    selected_wallpaper = curses.wrapper(select_wallpaper, wallpapers)

    if selected_wallpaper:
        # curses.wrapper handles ending curses mode
        print(f"Setting wallpaper to: {os.path.basename(selected_wallpaper)}")
        set_wallpaper(selected_wallpaper)
        update_hyprpaper_conf(selected_wallpaper)


if __name__ == "__main__":
    main()
