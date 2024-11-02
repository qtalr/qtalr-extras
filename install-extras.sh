#!/usr/bin/env bash

# Interactive script to install extra resources for R development
# Author: Jerid Francom
# Date: 2024-11-01

# Prompt user for each step
# use [y/n] to determine if the step should be executed
# the default is [y] for yes
#
# Before starting, explain what the script will do
# and ask for confirmation to proceed

echo "This script will install extra resources for R development."
echo "These resources include: "
echo "  - Git configuration"
echo "  - R packages"
echo "  - RStudio preferences"

echo "Do you want to proceed? ([y]/n)"
read -r proceed

if [ "$proceed" == "n" ]; then
    echo "Exiting script"
    exit 0
fi

echo "Updating and upgrading your system"
sudo apt update && sudo apt upgrade -y

# Prompt user to configure git settings
# user.name and user.email

echo "Would you like to configure git settings? ([y]/n)"
read -r git_settings

if [ "$git_settings" == "y" ]; then
    echo "Enter your git user.name: "
    read -r git_name
    git config --global user.name "$git_name"

    echo "Enter your git user.email: "
    read -r git_email
    git config --global user.email "$git_email"

    echo "Would you like to set up SSH keys for GitHub? ([y]/n)"
    read -r ssh_keys

    if [ "$ssh_keys" == "y" ]; then
        ssh-keygen -t rsa -b 4096 -C "$git_email"
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/id_rsa
        echo "Your public key is:"
        cat ~/.ssh/id_rsa.pub
        echo "Copy this key to your GitHub account"
    else
        echo "Skipping SSH key setup"
    fi

    echo "Git settings configured"

else
  echo "Skipping git settings configuration"
fi

# Install R packages: run r-pkg-install.R

echo "Install R dependencies (R packages)? ([y]/n)"
read -r install_deps

if [ "$install_deps" == "y" ]; then
    Rscript r-pkgs-install.R
else
    echo "Skipping R package installation"
fi

# Install RStudio preferences

echo "Install recommended RStudio preferences? ([y]/n)"
read -r install_prefs

if [ "$install_prefs" == "y" ]; then
    cp -v ./.Rprofile ~/.Rprofile
    cp -v ./.Renviron ~/.Renviron
    mkdir -p ~/.config/rstudio
    cp -v ./rstudio-prefs.json ~/.config/rstudio/rstudio-prefs.json
    echo "RStudio preferences installed"
else
    echo "Skipping RStudio preferences installation"
fi

echo "Script completed"




