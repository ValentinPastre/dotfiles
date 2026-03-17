#!/usr/bin/env bash

# Función que maneja la lógica cuando se abre una ventana
manejar_nueva_ventana() {
    local workspace_name="$1"
    
    local window_count
    window_count=$(hyprctl clients -j | jq "[.[] | select(.workspace.name == \"$workspace_name\")] | length")
    
    if (( window_count % 2 != 0 )); then
        hyprctl dispatch layoutmsg addmaster > /dev/null
    fi
}

socat -U - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
    
    if [[ "$line" == openwindow* ]]; then
        
        payload="${line#*>>}"
        
        IFS=',' read -r address workspace_name basura <<< "$payload"
        
        manejar_nueva_ventana "$workspace_name"
    fi
    
done
