#!/bin/bash

# Set keyboard layout
setxkbmap it

# Start necessary programs
exec ~/.startup &

# Start window manager
exec dwm

