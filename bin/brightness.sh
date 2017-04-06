#!/usr/bin/env bash

file_brightness='/sys/class/backlight/intel_backlight/brightness'
file_max='/sys/class/backlight/intel_backlight/max_brightness'
cur=$(cat "$file_brightness")
max=$(cat "$file_max")

if [ ! -w "$file_brightness" ]; then
  echo "Can't set the new brightness, try with sudo or as root."
  exit 2
fi

new=$(($cur $1 $2))
new=$(($new>$max?$max:$new))
new=$(($new<0?0:$new))
echo $new > "$file_brightness"
echo "New brightness: $new/$max."
