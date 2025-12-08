#!/bin/bash

# Fix fingerprint scanner for ThinkPad T480
# This installs python-validity for the 06cb:009a sensor
echo "========================================="
echo "Setting up fingerprint scanner for T480"
echo "========================================="


# Create symbolic link for pod2man if it doesn't exist
if [ ! -f /usr/bin/pod2man ]; then
    echo "Creating pod2man symlink..."
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

# Enable and start the python3-validity service
echo "Enabling and starting python3-validity service..."
sudo systemctl enable python3-validity
sudo systemctl start python3-validity


# Wait a moment for the service to initialize
sleep 2

# Delete any existing fingerprints for current user
echo "Clearing any existing fingerprints..."
sudo fprintd-delete "$USER" 2>/dev/null || true

echo "========================================="
echo "Ready to enroll your fingerprint"
echo "Follow the prompts and scan your finger"
echo "multiple times when requested"
echo ">>> fprintd-enroll"
echo "========================================="
