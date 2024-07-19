#!/bin/bash

# This is taken from josean-dev, he made a great video on it, check out his repo here: 
# https://github.com/josean-dev/dev-environment-files/tree/main/.config/sketchybar

sketchybar --add item front_app left \
           --set front_app       background.color=$ACCENT_COLOR \
                                 icon.color=$WHITE \
                                 icon.font="sketchybar-app-font:Regular:16.0" \
                                 label.color=$WHITE \
                                 script="$PLUGIN_DIR/front_app.sh"            \
           --subscribe front_app front_app_switched
