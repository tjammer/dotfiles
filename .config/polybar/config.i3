[colors]
background = #ff292d3e
foreground = #bfc7d5
yellow = #ffcb6b
dark-yellow = #F78C6C
black = #073642
white = #bfc7d5
red = #ac4142
green = #a9c77d
blue = #82aaff
magenta = #c792ea
cyan = #89ddff
tray-bg = #ac4142

[bar/master]
width = 100%
height = 28
background = ${colors.background}
foreground = ${colors.foreground}
fixed-center = true

font-0 = "DejaVu Sans:pixelsize=9:antialias=true;2"
font-1 = "FontAwesome:size=9:antialias=true;2"
font-2 = "MaterialIcons:size=10:antialias=true;3"

underline-size = 2
underline-color = ${colors.magenta}

[bar/top]
inherit = bar/master
modules-left = wm
modules-center = datetime
modules-right = ram cpu temperature volume battery wireless-network menu0

padding = 1

module-margin = 1

tray-position = right
tray-transparent = false
tray-detached = false

[module/ovpn]
type = internal/network
interface = tun0
interval = 3.0
exec-if = pgrep openvpn

format-connected-padding = 1
format-disconnected-padding = 1

format-connected = <label-connected>

label-connected = 
label-connected-foreground = ${colors.cyan}

label-disconnected = 
label-disconnected-foreground = ${colors.red}

[module/volume]
type = internal/volume

;format-volume-padding = 1
format-volume = <ramp-volume> <label-volume>
format-volume-foreground = ${colors.yellow}
label-muted =  0%
label-muted-foreground = ${colors.yellow}
click-right = exec pavucontrol

ramp-volume-0 = 
ramp-volume-1 = 
ramp-volume-2 = 
ramp-volume-3 = 

[module/temperature]
type = custom/script

exec = echo `sensors -A | grep -oP '^Core 0.+?  \+\K\d+' `°
interval = 5
format-prefix = "  "
format-suffix = "C"
;format-padding = 2
format-foreground = ${colors.green}

[module/wireless-network]
type = internal/network
interface = wlp3s0
interval = 3.0
ping-interval = 10

format-connected = <ramp-signal> <label-connected>
format-connected-foreground = ${colors.magenta}
label-connected = %essid%
label-disconnected = 
format-disconnected-foreground = ${colors.magenta}

ramp-signal-0 = 
ramp-signal-1 = 
ramp-signal-2 = 
ramp-signal-3 = 
ramp-signal-4 = 

animation-packetloss-0 = 
animation-packetloss-0-foreground = #e8e8e8a64c
animation-packetloss-1 = 
animation-packetloss-1-foreground = ${bar/top.foreground}
animation-packetloss-framerate = 500

[module/wired-network]
type = internal/network
interface = enp3s0
interval = 3.0

label-connected = 
label-disconnected-foreground = #66
label-connected-padding = 2

[module/title]
type = internal/xwindow
label = %title%
label-maxlen = 75

[module/ram]
type = internal/memory
interval = 3

format-prefix = "    "
label = %gb_used%
;format-padding = 2
format-foreground = ${colors.blue}

[module/cpu]
type = internal/cpu
interval = 1

format = <ramp-coreload>
label = %percentage%%
;label-padding = 2
format-foreground = ${colors.cyan}

ramp-coreload-0 = ▁
ramp-coreload-1 = ▂
ramp-coreload-2 = ▃
ramp-coreload-3 = ▄
ramp-coreload-4 = ▅
ramp-coreload-5 = ▆
ramp-coreload-6 = ▇
ramp-coreload-7 = █

[module/wm]
type = internal/i3
enable-click = true
enable-scroll = false
strip-wsnumbers = true

format-padding = 1
label-focused-foreground = ${colors.magenta}
label-focused-background = ${colors.background}
label-focused-underline = ${colors.magenta}
label-focused-padding-right = 3
label-focused-padding = 2

label-unfocused-padding = 2
label-unfocused-background = ${colors.background}
label-unfocused-foreground= ${colors.foreground}
label-unfocused-padding-right = 3

label-visible-padding = 2
;label-visible-padding-right = 2

label-urgent-foreground = ${colors.red}
label-urgent-background = ${colors.background}
label-urgent-padding = 2
label-urgent-padding-right = 3

[module/datetime]
type = internal/date
interval = 1.0
date = %a %b %d, %H:%M
format-foreground = ${colors.magenta}

[module/time]
type = internal/date
interval = 1.0
date = %H:%M

[module/date]
type = internal/date
interval = 60.0
date =  %a, %d %b

[module/menu0]
type = custom/menu

format = <label-toggle> <menu>
;format-padding = 2
format-foreground = ${colors.magenta}

menu-0-0 =  shutdown
menu-0-0-exec = systemctl poweroff
menu-0-1 =  restart
menu-0-1-exec = systemctl reboot
menu-0-2 =  cancel

label-open =  
label-close =

[module/battery]
type=internal/battery

full-at = 99

battery = BAT0
adapter = AC

poll-interval = 5

; see "man date" for details on how to format the time string
; NOTE: if you want to use syntax tags here you need to use %%{...}
; Default: %H:%M:%S
time-format = %H:%M

format-charging = <animation-charging> <label-charging>
format-charging-foreground = ${colors.dark-yellow}

format-discharging = <ramp-capacity> <label-discharging>
format-discharging-foreground = ${colors.dark-yellow}

;format-full = <ramp-capacity> <label-full>
format-full-foreground = ${colors.dark-yellow}

label-charging = %percentage%%

label-discharging = %percentage%% %time%

; Available tokens:
;   %percentage% (default)
label-full = 

; Only applies if <ramp-capacity> is used
ramp-capacity-0 = 
ramp-capacity-1 = 
ramp-capacity-2 = 
ramp-capacity-3 = 
ramp-capacity-4 = 

; Only applies if <bar-capacity> is used
bar-capacity-width = 10

; Only applies if <animation-charging> is used
animation-charging-0 = 
animation-charging-1 = 
animation-charging-2 = 
animation-charging-3 = 
animation-charging-4 = 
; Framerate in milliseconds

[module/power-label]
type = custom/text
content = "  "

content-foreground = ${colors.background}
content-background = ${colors.magenta}
click-left = bash ~/.config/polybar/popups/power/power
