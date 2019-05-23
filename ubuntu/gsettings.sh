#!/usr/bin/env bash

# change movement key
# gconftool-2 -s --type string /apps/metacity/general/mouse_button_modifier "<Super>"
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier '<Super>'

# window shade from mouse scroll on title bar
# gconftool-2 -s /apps/gwd/mouse_wheel_action -t string "shade"
gsettings set org.compiz.gwd mouse-wheel-action "shade"

# enable menu icons
gsettings set org.gnome.desktop.interface menus-have-icons true

# show position of pointer when the Control key is pressed
gsettings set org.gnome.settings-daemon.peripherals.mouse locate-pointer true

################################################################################
#
# fixes
#

# stop laptop from suspending when plugging in power adapter
gsettings set org.gnome.settings-daemon.plugins.power use-time-for-policy false
