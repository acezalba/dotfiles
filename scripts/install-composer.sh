#!/bin/sh

# Script taken from
# https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md

# Modified to make composer phar global

download_composer() {
    EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

    if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
    then
        >&2 echo 'ERROR: Invalid installer checksum'
        rm composer-setup.php
        exit 1
    fi

    php composer-setup.php --quiet
    rm composer-setup.php
}

make_composer_global() {
    sudo mv composer.phar /usr/local/bin/composer
}

cd $HOME
download_composer
make_composer_global
