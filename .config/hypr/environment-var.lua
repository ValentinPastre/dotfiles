hl.env("FREETYPE_PROPERTIES", "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("TZ", "America/Argentina/Cordoba")
hl.env("HYPRSHOT_DIR", "/home/valentin/Images/Screenshots/")
-- iHD para Intel, radeonsi para AMD.
hl.env("LIBVA_DRIVER_NAME", os.getenv("LIBVA_DRIVER_NAME"))

-- QT Variables
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1.25")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")

-- Toolkit Backend Variables
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
-- Elimine o configure en x11
-- si los juegos que proporcionan
-- versiones más antiguas de SDL causan
-- problemas de compatibilidad
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Theming
-- El theme del cursor debe estar en .local/share/icons/
hl.env("XCURSOR_THEME", "BreezeX-Light")
hl.env("XCURSOR_SIZE", "36")
