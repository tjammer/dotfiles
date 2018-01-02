#!/bin/bash
xbacklight -inc 10
notify-send "brightness up to $(xbacklight -get)"
