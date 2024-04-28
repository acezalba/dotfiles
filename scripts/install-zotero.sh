#!/usr/bin/env bash

# Install script for zotero
# 2024-04-28, 04:42:54 AM

install_link="https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64"
install_name="zotero.tar.bz2"
install_dir="zotero"
install_loc="/opt"

download_tarball(){
    download_link=$1
    download_rename=$2
    if ! wget "$download_link" --output-document="/tmp/$download_rename"; then
        echo "Download failed" >&2
        exit 1
    fi
}

extract_tarball(){
    downloaded_tarfile=$1
    rename_parent=$2
    tar -xf "/tmp/${downloaded_tarfile}" -C /tmp
    tar -tf "/tmp/${downloaded_tarfile}" | head -1 | cut -d/ -f1 | xargs -I {} mv "/tmp/{}" "/tmp/${rename_parent}" 
}

install_tarball(){
    app=$1
    location=$2
    # if reuse, modify var to match executable in actual dir/desktop file.
    # this is used in overwriting exec key in desktop file.
    # to allow for edits via the gui (symlink breaks this)
    exec_path="$location/$app/$app -url %U"
    sudo rm -rf "$location"/"$app"
    sudo mv "/tmp/$app" "$location"
    sudo bash "$location"/"$app"/set_launcher_icon

    sudo rm -rf "$HOME"/.local/share/applications/"$app".desktop
    cp -f "$location"/"$app"/"$app".desktop "$HOME"/.local/share/applications/"$app".desktop
    sed -i 's|^Exec=.*|Exec='"$exec_path"'|' "$HOME"/.local/share/applications/"$app".desktop 
}

download_tarball "$install_link" "$install_name"
extract_tarball "$install_name" "$install_dir"
install_tarball "$install_dir" "$install_loc"