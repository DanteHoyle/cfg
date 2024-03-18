# File: .zprofile

export GTK_THEME="Catppuccin-Mocha-Standard-Green-Dark"

# Launches sway on login
if [ -z "${WAYLAND_DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway
fi
