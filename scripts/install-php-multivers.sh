#!/usr/bin/env bash

# Command chain to install
# multiversion php

# Refer to this https://make.wordpress.org/hosting/handbook/server-environment/
# to improve this script

# Docs on the ppa are on https://github.com/oerdnj/deb.sury.org


sudo apt install software-properties-common -y
sudo apt-get update -y
sudo add-apt-repository ppa:ondrej/php -y
sudo add-apt-repository ppa:ondrej/apache2 -y
sudo add-apt-repository ppa:ondrej/nginx -y
sudo apt install openssl -y
sudo apt install libcurl4-openssl-dev -y
sudo apt install libssl-dev -y
sudo apt install imagemagick -y
sudo apt install apache2 -y

function install_php_extensions() {
  # Array of PHP extensions required by WordPress
  php_extensions=("bc" "curl" "dom" "exif" "gd" "fpm" "imagick" "iconv" "intl" "mbstring" "mysqli" "soap" "shmop" "xml" "xmlrpc" "zip" )

  # PHP version
  php_version="8.2"

  # Loop through the extensions and install them
  for extension in "${php_extensions[@]}" 
  do
    echo "Installing recommended PHP extension: $extension"
    if ! sudo apt-get install -y "php${php_version}-$extension"; then
      echo "Failed to install PHP extension: $extension. Please check for errors."
      exit 1 
    fi
  done

  echo "Enabling newly installed extensions..."
  sudo phpenmod -v $php_version -s ALL "$(printf '%s ' "${php_extensions[@]}") "

  echo "Restarting Apache (or your web server) for changes to take effect..."
  sudo service apache2 restart 
}

install_php_extensions