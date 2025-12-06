#!/bin/bash

# Fix fingerprint scanner for ThinkPad T480
# This installs python-validity for the 06cb:009a sensor

# Create symbolic link for pod2man if it doesn't exist
if [ ! -f /usr/bin/pod2man ]; then
    sudo ln -s /usr/bin/core_perl/pod2man /usr/bin/pod2man
fi

# Remove conflicting fprintd package if it exists
if pacman -Qi fprintd &>/dev/null; then
    echo "Removing conflicting fprintd package..."
    sudo pacman -Rdd --noconfirm fprintd
fi

# Install python-validity if not already installed
if ! pacman -Qi python-validity &>/dev/null; then
    yay -S --noconfirm --needed python-validity
fi

# Enroll fingerprint
echo "Starting fingerprint enrollment..."
echo "Follow the prompts to scan your finger multiple times."
fprintd-enroll