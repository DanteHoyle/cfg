# File: .zprofile

# Launches sway on login
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    export GTK_THEME="Catppuccin-Mocha-Standard-Green-Dark"
    exec sway
fi
