# dotfiles
* Mis dotfiles de arch linux
* Necesario tener instalado GNU Stow
* El repositorio se tiene que clonar en ~/

# importante
- #### Archivo para docker
    - **cp docker-images/daemon.json /etc/docker/daemon.json**
    - Eso hace que docker descargue las imagenes en la carpeta **~/docker-images**
- #### Archivo para tlp
    - **cp tlp/config-01.conf /etc/tlp.d/**
    - sobreescribe la configuracion de tlp a la mia.

# Programas a tener instalados para Hyprland
- bluetoothctl
- hyprpolkitagent
- hyprpaper
- pipewire
- wireplumber
- xdg-desktop-portal-hyprland
- swaync
- nwg-look
- waybar
- tlp                   //Hay que habilitar el servicio y enmascarar otros.
                        //Cualquier cosa, ver la wiki.

- tlp-rdw               //usar tlp-stat -s y tlp-stat -r para ver
                        //el modo que actualmente se usa y los
                        //chipsets activos (wifi, bluetooth, etc)
- rofi-wayland
- hyprshot
- hypridle
- hyprlock
- hyprsunset
- qt6ct
- qt5ct
- breezex-cursor-theme
- brightnessctl
- pulseaudio
- pulseaudio-alsa
- pipewire-alsa
- thunar
- thunar-volman
- thunar-archive-plugin
- gvfs
- gvfs-mtp
- spotify-player
- wlogout
- docker
- postgresql
- npm
- obsidian
- ruby
- rbenv
- pyenv
- haskell
- gcc
- java
- lisp
- xorg-server
- xorg-xinit
- ttf-nerd-fonts-symbols
- ttf-noto-nerd
- ttf-roboto-mono-nerd
- tree
- timeshift
- thermald
- swaync
- slack-desktop
- otf-font-awesome
- neovim
- nodejs
- networkmanager
- mpv
