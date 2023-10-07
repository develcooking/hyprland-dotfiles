cliphist list | rofi -dmenu -i -p "Clipboard:" \
          -theme "~/.config/rofi/clipboard.rasi"| cliphist decode | wl-copy 
