#!/bin/sh

# Install Git scripts
mv /tmp/git/bin/* /usr/local/bin/

# Move Git configuration file to proper location
mkdir -p "$HOME"/.config/git
mv /tmp/git/config "$HOME"/.config/git/

# Download Git attributes file for web development
wget -qO "$HOME"/.config/git/attributes \
  https://raw.githubusercontent.com/alexkaratarakis/gitattributes/master/Web.gitattributes

# Set up Git hooks
git hooks
mv /tmp/git/hooks/* "$HOME"/.config/git/hooks/plugins/

# ----------------------------------------
# Install `git-lfs` using pre-compiled
# binary from GitHub latest release
# ----------------------------------------

# Get URL for latest `git-lfs` release and sha256sum
api=https://api.github.com/repos/git-lfs/git-lfs/releases/latest
url="$(wget -qO - "$api" | grep 'download_url.*linux-amd64' | cut -d \" -f 4)"
lfs="${url##*/}"
sum="$(wget -qO - "${url%/*}"/sha256sums.asc | grep "$lfs" | cut -d ' ' -f 1)"

# Download the latest `git-lfs` release
wget -qO /tmp/"$lfs" "$url"

# Verify `git-lfs` sha256sum
test "$(sha256sum /tmp/"$lfs" | cut -d ' ' -f 1)" = "$sum" || \
  { echo 'ERROR: git-lfs checksum mismatch' >&2; exit 1; }

# Install `git-lfs` to /usr/local/bin
tar -C /usr/local/bin -xzf /tmp/"$lfs" git-lfs
