#!/usr/bin/env bash

# Install latest release binary of yt-dlp
# without installing from source
# https://github.com/yt-dlp/yt-dlp/wiki/Installation#with-pip
# 2024-04-25, 07:18:37 AM


curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
chmod a+rx ~/.local/bin/yt-dlp  # Make executable