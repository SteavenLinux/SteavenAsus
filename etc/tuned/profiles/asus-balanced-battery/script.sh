#!/bin/bash

# Get the laptop model
CURRENT_MODEL=$(cat /sys/class/dmi/id/product_name)

# Check if the model matches the intended one
if [[ "$CURRENT_MODEL" == "ROG Strix G512LI_G512LI" ]]; then
    echo "Running script on $CURRENT_MODEL..."
    asusctl led-mode static -c f7266b
    asusctl -k med
    asusctl profile -P Balanced
else
    echo "This script is not designed for $CURRENT_MODEL. Exiting."
fi