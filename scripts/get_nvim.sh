#!/bin/sh

# remove previous install if it exists
sudo rm -rf /opt/nvim

# remove previous install symbolic link if one exists
rm /usr/local/bin/nvim

# downloads and extracts nvim to /opt/nvim-linux64
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# create symbolic link to a location path already includes
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

# clean install archive
rm nvim-linux64.tar.gz