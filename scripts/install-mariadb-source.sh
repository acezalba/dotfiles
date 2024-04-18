#!/usr/bin/env bash

# Build Mariadb from source
# and create ansible superuser

# https://mariadb.com/kb/en/get-build-and-test-latest-mariadb-the-lazy-way/
# 2024-04-18, 06:46:42 PM
# I got stuck on PAM_AUTH cannot be built.

add_repo(){
    #https://mariadb.org/download/?t=repo-config&d=22.04+%22jammy%22&v=10.11&r_m=ossplanet
    sudo apt-get install apt-transport-https curl
    sudo mkdir -p /etc/apt/keyrings
    sudo curl -o /etc/apt/keyrings/mariadb-keyring.pgp 'https://mariadb.org/mariadb_release_signing_key.pgp'
}

make_sources(){
    sudo touch /etc/apt/sources.list.d/mariadb.sources
    echo "# MariaDB 10.11 repository list - created 2024-04-18 09:10 UTC" | sudo tee -a /etc/apt/sources.list.d/mariadb.sources
    echo "# https://mariadb.org/download/" | sudo tee -a /etc/apt/sources.list.d/mariadb.sources
    echo "X-Repolib-Name: MariaDB" | sudo tee -a /etc/apt/sources.list.d/mariadb.sources
    echo "Types: deb deb-src" | sudo tee -a /etc/apt/sources.list.d/mariadb.sources
    echo "# deb.mariadb.org is a dynamic mirror if your preferred mirror goes offline. See https://mariadb.org/mirrorbits/ for details." | sudo tee -a /etc/apt/sources.list.d/mariadb.sources
    echo "# URIs: https://deb.mariadb.org/10.11/ubuntu" | sudo tee -a /etc/apt/sources.list.d/mariadb.sources
    echo "URIs: https://ftp.ubuntu-tw.org/mirror/mariadb/repo/10.11/ubuntu" | sudo tee -a /etc/apt/sources.list.d/mariadb.sources
    echo "Suites: jammy" | sudo tee -a /etc/apt/sources.list.d/mariadb.sources
    echo "Components: main main/debug" | sudo tee -a /etc/apt/sources.list.d/mariadb.sources
    echo "Signed-By: /etc/apt/keyrings/mariadb-keyring.pgp" | sudo tee -a /etc/apt/sources.list.d/mariadb.sources

}

install_dependencies(){
    apt update
    apt build-dep mariadb-server
    apt install -y software-properties-common \
                    devscripts \
                    equivs \
                    build-essential \
                    bison \
                    libgnutls28-dev \
                    libaio-dev \
                    liblzo2-dev \
                    libsnappy-dev \
                    libboost-system-dev \
                    libboost-filesystem-dev \
                    libboost-thread-dev \
                    libboost-regex-dev \
                    libboost-date-time-dev \
                    libboost-chrono-dev \
                    libboost-atomic-dev \
                    liblz4-dev \
                    libpam0g-dev \
                    liburing-dev \
                    libzstd-dev

}

clone_to_src(){
    # git clone https://github.com/MariaDB/server.git "$HOME"/src/mariadb
    cd "$HOME"/src/mariadb || return
    git checkout 10.11
}

build_mariadb(){
    mkdir  "$HOME"/src/build-mariadb
    cd "$HOME"/src/build-mariadb || return
    cmake "$HOME"/src/mariadb -DBUILD_CONFIG=mysql_release
}

install_mariadb(){
    "$HOME"/src/mariadb/scripts/mariadb-install-db --user=mysql \
                                               --basedir=/opt/mysql/mysql \
                                               --datadir=/opt/mysql/mysql/data
}

# add_repo
# make_sources
# install_dependencies
# clone_to_src
build_mariadb
# install_mariadb

