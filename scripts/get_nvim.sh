#!/bin/sh

# installs curl if it is not already installed
if ! [ -x curl ]
then
    sudo apt-get install curl
fi

# remove previous nvim install if it exists
if [ -d /opt/nvim ]
then
    echo "Removing previous nvim installation: /opt/nvim"
    sudo rm -rf /opt/nvim
fi

# remove previous install symbolic link if one exists
if [ -e /usr/local/bin/nvim ]
then
    echo "Removing symbolic link: /usr/local/bin/nvim"
    rm /usr/local/bin/nvim
fi

# downloads and extracts nvim to /opt/nvim-linux64
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# create symbolic link to a location path already includes
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

# clean install archive
rm nvim-linux64.tar.gz
