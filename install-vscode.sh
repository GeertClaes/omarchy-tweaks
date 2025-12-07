#!/bin/bash

# Install Visual Studio Code
if ! command -v code &>/dev/null; then
    yay -S --noconfirm --needed visual-studio-code-bin
    echo "========================================="
    echo "========================================="
    echo "========================================="
    echo "========================================="
fi
echo "Visual Studio Code installation complete!"