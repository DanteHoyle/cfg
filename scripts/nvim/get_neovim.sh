#!/bin/sh
# File: get_neovim.sh
# Description: This script will install the latest version of Neovim onto your system

INSTALL_ROOT=/opt           # nvim-linux64 binary folder
SYMLINK_ROOT=/usr/local/bin # location in your path so you can run nvim anywhere
URL="https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz"

# checks if curl is installed
if ! command -v curl >/dev/null; then
    # prints an error and quits the program if it is not installed
    echo "Error: You must have curl installed on your system to proceed"
    exit 1
fi

# Checks if there is a directory at the symbolic executable path, typically /usr/local/bin/nvim
if [ -e "$SYMLINK_ROOT/nvim" ]; then
    # attempts to delete existing symbolic link if there is one
    echo "Detected an existing symbolic link at $SYMLINK_ROOT/nvim. The script will delete this now..." 
    if sudo rm "$SYMLINK_ROOT/nvim"
    then
        echo "Successfully removed $SYMLINK_ROOT/nvim!"
    else
        echo "Error: An error was encountered while removing the symlink. Quitting the program..."
        exit 1
    fi
fi

# Checks if there is a directory at the install path, typically /opt/nvim-linux-64
if [ -d "$INSTALL_ROOT/nvim-linux64" ]; then
    # removes previous nvim installation
    echo "Detected previous nvim installation at: $INSTALL_ROOT/nvim-linux64. The script will delete this now..."
    if sudo rm -rf "$INSTALL_ROOT/nvim-linux64"
    then
        echo "Successfully removed $INSTALL_ROOT/nvim-linux64!"
    else
        echo "Error: an error was encountered while removing $INSTALL_ROOT/nvim-linux64. Quitting the program..."
        exit 1
    fi
fi

# downloads and extracts nvim to /opt/nvim-linux64
curl -LO $URL
sudo tar -C /opt -xzf nvim-linux64.tar.gz
# create symbolic link from the nvim binary to a path the user ca
sudo ln -s "$INSTALL_ROOT/nvim-linux64/bin/nvim" "$SYMLINK_ROOT/nvim"
# clean install archive
rm nvim-linux64.tar.gz

echo "Neovim has successfully been installed!"
