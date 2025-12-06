#!/bin/bash

# Install HyprDynamicMonitors
if ! command -v hyprdynamicmonitors &>/dev/null; then
    yay -S --noconfirm --needed hyprdynamicmonitors-bin
fi