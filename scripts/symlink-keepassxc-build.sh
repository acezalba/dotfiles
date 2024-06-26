#!/usr/bin/env bash

# The following command chain symlinks the build artifacts
# Generated by the release-tool
# bundled with the keepassxc repo.

releasepath="/home/ghost/src/keepassxc/release/KeePassXC.AppDir"

# Create symbolic links for execs
for target in keepassxc keepassxc-cli keepassxc-proxy; do
  ln -sf $releasepath/usr/local/bin/$target /usr/local/bin/$target
done

# Create symbolic links for lib
for target in keepassxc; do
  ln -sf $releasepath/usr/local/lib/$target /usr/local/lib/$target
done


# Copy share resource files cautiously (add -n to prevent overwriting)
for dir in applications icons keepassxc man metainfo mime; do
  \cp -rf $releasepath/usr/local/share/$dir /usr/local/share/$dir
done