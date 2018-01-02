#!/bin/bash
xbacklight -dec 10
notify-send "brightness down to $(xbacklight -get)"
