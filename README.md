# dotfiles
* Mis dotfiles de arch linux
* Necesario tener instalado GNU Stow
* El repositorio se tiene que clonar en ~/

# importante
- ### (Deprecated)
- #### Archivo para docker
    - **cp docker-images/daemon.json /etc/docker/daemon.json**
    - Eso hace que docker descargue las imagenes en la carpeta **~/docker-images**

- ### (Actual)
- #### Archivo para docker
    - **sudo ln -s ~/docker-images /var/lib/docker**
    - Esto hace que se cree un symlink */var/lib/docker -> ~/docker-images*
- #### Archivo para tlp
    - **cp tlp/config-01.conf /etc/tlp.d/**
    - sobreescribe la configuracion de tlp a la mia.

# Programas a tener instalados para Hyprland
- hyprpolkitagent
- hyprpaper
- xdg-desktop-portal-hyprland
- nwg-look
- waybar
- rofi
- hyprshot
- hypridle
- hyprlock
- hyprsunset
- qt6ct
- qt5ct
- breezex-cursor-theme
- wlogout
- ttf-nerd-fonts-symbols
- ttf-noto-nerd
- ttf-roboto-mono-nerd
- otf-font-awesome
- ttf-jetbrains-mono-nerd
- kitty
- pavucontrol
- thunar
- thunar-volman
- thunar-archive-plugin
- gvfs
- gvfs-mtp
- brightnessctl

# Programas para el OS
- amd-ucode
- go
- bluez
- clamav
- docker
- docker-compose
- ghc
- git
- gnome-keyring
- nodejs
- networkmanager
- xorg-server
- xorg-xinit
- ruby
- rbenv
- pyenv
- haskell
- gcc
- java
    - jdk21-openjdk
    - gradle
    - maven
- lisp
- r
- rust
- postgresql
- npm
- **tlp**                   //Hay que habilitar el servicio y enmascarar otros.
                        //Cualquier cosa, ver la wiki.

- **tlp-rdw**               //usar tlp-stat -s y tlp-stat -r para ver
                        //el modo que actualmente se usa y los
                        //chipsets activos (wifi, bluetooth, etc)
- **tlp-pd**
- ~swaync~ mako
- pipewire
- pipewire-alsa
- pipewire-pulse
- wireplumber
- bluetoothctl
- haskell-language-server
- ly
- mesa
    - vkd3d
    - vulkan-radeon
    - vulkan-tools
- solaar
- stow
- thermald
- mpv
- tree
- wine
- xf86-video-amdgpu
- 7z
- neovim


# programas de uso personal
- timeshift
- tailscale
- spotify-player
- obsidian
- tree
- slack
- steam
- discord
- gamemode
- gamescope
