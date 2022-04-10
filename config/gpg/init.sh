#!/bin/sh

# Init GPG/SSH configuration directories
mkdir -p "$HOME"/.gnupg "$HOME"/.ssh
chmod 2700 "$HOME"/.gnupg "$HOME"/.ssh

# Copy configuration files to proper locations
cp /tmp/gpg/gpg*.conf "$HOME"/.gnupg/
cp /tmp/gpg/config "$HOME"/.ssh/
cp /tmp/gpg/known_hosts "$HOME"/.ssh/

# Set file permissions
chmod 600 "$HOME"/.gnupg/* "$HOME"/.ssh/*
