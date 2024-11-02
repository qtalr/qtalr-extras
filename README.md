# Extras

This repository contains a set of resources to compliment the qtalr-\* docker containers. However, the resources can be used independently of the containers.

## Usage

To use the resources, clone the repository and then run the `./install-extras.sh` script.

```bash
git clone https://github.com/qtalr/qtalr-extras.git
cd qtalr-extras
./install-extras.sh
```

## What does the script do?

The script will prompt you to:

- install system dependencies
  - runs `apt-get update` and `apt-get upgrade`
- setup git configuration
  - git user name and user email
  - ssh key (to add to GitHub)
- install RStudio preferences
  - copies a custom `rstudio-prefs.json` file to the RStudio configuration directory
  - adds a `.Rprofile` and `.Renviron` file to the user's home directory
- install R packages
  - installs packages and versions used in the book and recipes
- remove the cloned repository

You can choose to skip any of the steps.
