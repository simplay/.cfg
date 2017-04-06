#!/usr/bin/env bash

current_keyboard_layout=`setxkbmap -query | grep layout | awk '{print $2}'`
if [ "$current_keyboard_layout" = "ch" ]; then 
  setxkbmap us
  setxkbmap -option 'caps:ctrl_modifier'
else
  setxkbmap ch
  setxkbmap -option 'caps:ctrl_modifier'
fi;
