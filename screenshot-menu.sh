#!/usr/bin/env bash

shotdir="$HOME/Pictures/screenshots"
recdir="$HOME/Videos/recordings"

mkdir -p "$shotdir"
mkdir -p "$recdir"

shotfile="$shotdir/$(date +%Y-%m-%d_%H-%M-%S).png"
recfile="$recdir/$(date +%Y-%m-%d_%H-%M-%S).mp4"

choice=$(printf "Screenshot Full\nScreenshot Area\nScreenshot Clipboard\nRecord Full\nRecord Area\nStop Recording\n" | rofi -dmenu -i -p "Capture")

case "$choice" in
"Screenshot Full")
    grim "$shotfile"
    ;;
"Screenshot Area")
    grim -g "$(slurp)" "$shotfile"
    ;;
"Screenshot Clipboard")
    grim -g "$(slurp)" - | wl-copy
    ;;
"Record Full")
    wf-recorder -f "$recfile"
    ;;
"Record Area")
    wf-recorder -g "$(slurp)" -f "$recfile"
    ;;
"Stop Recording")
    pkill wf-recorder
    ;;
esac
