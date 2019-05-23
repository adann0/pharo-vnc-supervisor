#!/bin/bash

# Launch Squeak
if [ -z "$SQUEAK_START_SCRIPT" ]; then
    squeak $SQUEAK_IMAGE_LOCATION
else
    squeak $SQUEAK_IMAGE_LOCATION -e "$SQUEAK_START_SCRIPT"
fi
