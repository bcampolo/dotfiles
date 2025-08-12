#!/bin/bash

# Bind Previous Track Media Key to Home Key
xmodmap -e "keysym 0x1008ff16 = Home"

# Bind Next Track Media Key to End Key
xmodmap -e "keysym 0x1008ff17 = End"

# Swap Caps Lock and Escape keys
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"
