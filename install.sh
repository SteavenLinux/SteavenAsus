#!/bin/bash

# Get the laptop model
CURRENT_MODEL=$(cat /sys/class/dmi/id/product_name)

# Check if the model matches the intended one
if [[ "$CURRENT_MODEL" == "ROG Strix G512LI_G512LI" ]]; then
    echo "Running script on $CURRENT_MODEL..."
    sudo systemctl disable --now tuned tuned-ppd
    sudo pacman -Rns tuned tuned-ppd
    sudo rm -rf /etc/tuned
    sudo pacman -S tuned tuned-ppd
    sudo systemctl enable --now tuned tuned-ppd
    #sudo cp -r etc/* /etc
    #sudo rm -rf /etc/tuned/ppd.conf.bk
    #sudo systemctl restart tuned tuned-ppd
else
    echo "This script is not designed for $CURRENT_MODEL. Exiting."
fi