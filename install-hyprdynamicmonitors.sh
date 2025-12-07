#!/bin/bash

# Install HyprDynamicMonitors
if ! command -v hyprdynamicmonitors &>/dev/null; then
    yay -S --noconfirm --needed hyprdynamicmonitors-bin
    echo "========================================="
    echo "========================================="
    echo "========================================="
    echo "========================================="
fi
echo "Hyprdynamicmonitors installation complete!"
echo "Customise > hyprdynamicmonitors tui"