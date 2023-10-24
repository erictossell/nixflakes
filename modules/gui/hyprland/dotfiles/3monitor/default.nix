{ home-manager, username, ... }:
{
  home-manager.users.${username} =  { ... }: {
    home.file = {

      ".config/hypr/backgrounds".source = ./backgrounds;

      ".config/hypr/hyprland.conf".text = ''
monitor=DP-2,preferred,1080x400,1
monitor=HDMI-A-1,preferred,3640x0,1
monitor=DP-1,preferred,0x0,1,transform,3
monitor=,preferred,auto,auto

exec-once = waybar & hyprpaper & mako & lxqt-policykit-agent & dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# some default env vars.
env=BROWSER, firefox
env=XCURSOR_SIZE,24
env=XDG_CURRENT_DESKTOP,Hyprland
env=XDG_SESSION_DESKTOP,Hyprland
env=XDG_SESSION_TYPE,wayland
env=GDK_BACKEND,wayland,x11
env=QT_QPA_PLATFORM,wayland

# for all categories, see https://wiki.hyprland.org/configuring/variables/
input {
	kb_layout = us
	follow_mouse = 1
	touchpad {
		natural_scroll = no
	}
	sensitivity = -0.1 # -1.0 - 1.0, 0 means no modification.
}

general {
	gaps_in = 5
	gaps_out = 10
	border_size = 2
	col.active_border = rgba(00ba69ee) rgba(ffffffee) 45deg
	col.inactive_border = rgba(595959aa)
	layout = dwindle
	cursor_inactive_timeout = 0
	no_cursor_warps = yes
	resize_on_border = yes
	hover_icon_on_border = yes
}

decoration {
	rounding = 10
	drop_shadow = yes
	shadow_range = 4
	shadow_render_power = 3
	col.shadow = rgba(1a1a1aee)
	active_opacity = 0.85
	inactive_opacity = 0.8
	fullscreen_opacity = 1.0
	blur {
		enabled = yes
		size = 8
		passes = 3
		new_optimizations = true
		xray = true
		}
}

animations {
	enabled = yes
	bezier = snappyBezier, 0.4, 0.0, 0.2, 1.0
	bezier = smoothBezier, 0.25, 0.1, 0.25, 1.0
	animation = windows, 1, 7, snappyBezier
	animation = windowsOut, 1, 7, snappyBezier, popin 85%
	animation = border, 1, 10, snappyBezier
	animation = borderangle, 1, 8, smoothBezier
	animation = fade, 1, 7, smoothBezier
	animation = workspaces, 1, 6, smoothBezier
}

dwindle {
	pseudotile = yes # master switch for pseudotiling. enabling is bound to mainmod + p in the keybinds section below
	preserve_split = yes # you probably want this
}

master {
	new_is_master = true
}

gestures {
	workspace_swipe = off
}

device:epic-mouse-v1 {
	sensitivity = -0.5
}

$mainMod = SUPER

bind = $mainMod, q, exec, foot 
bind = $mainMod, w, killactive, 
bind = $mainMod, m, exit, 
bind = $mainMod, e, exec, kitty -e ranger
bind = $mainMod, v, togglefloating, 
bind = $mainMod, r, exec, wofi --show drun
bind = $mainMod, p, pseudo, # dwindle
bind = $mainMod, j, togglesplit, # dwindle
bind = $mainMod, 0, exec, swaylock
bind = $mainMod, s, exec, grim -g "$(slurp)" ~/Pictures/Screenshots/$(date +'%Y%m%d_%H%M%S').png

bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

bind = $mainMod shift, left, movewindow, l
bind = $mainMod shift, right, movewindow, r
bind = $mainMod shift, up, movewindow, u
bind = $mainMod shift, down, movewindow, d

$w2 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/hypr/backgrounds/scifi_landscape.jpg"
$w4 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/hypr/backgrounds/laptop_dj.jpg"
$w5 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/hypr/backgrounds/storage.jpg"
$w6 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/hypr/backgrounds/keyboard.png"
$w7 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/hypr/backgrounds/snow-tree.jpg"
$w8 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/hypr/backgrounds/moon.jpg"
$w9 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/hypr/backgrounds/disknee.jpg"

$wA = Alpha
$wB = Bravo
$wC = Charlie
$wD = Delta
$wE = Echo
$wF = Foxtrot
$wG = Golf
$wH = Hotel
$wI = are ya lost bud

workspace=name:$wA,monitor:DP-1
workspace=name:$wB,monitor:DP-2,default:true
workspace=name:$wC,monitor:HDMI-A-1
workspace=name:$wD,monitor:DP-2
workspace=name:$wE,monitor:DP-2
workspace=name:$wF,monitor:DP-2
workspace=name:$wG,monitor:DP-2
workspace=name:$wH,monitor:DP-2
workspace=name:$wI,monitor:DP-2
		
bind = $mainMod, 1, workspace, name:$wA

bind = $mainMod, 2, workspace, name:$wB
bind = $mainMod, 2, exec,$w2

bind = $mainMod, 3, workspace, name:$wC

bind = $mainMod, 4, workspace, name:$wD
bind = $mainMod, 4, exec,$w4

bind = $mainMod, 5, workspace, name:$wE
bind = $mainMod, 5, exec,$w5

bind = $mainMod, 6, workspace, name:$wF
bind = $mainMod, 6, exec,$w6

bind = $mainMod, 7, workspace, name:$wG
bind = $mainMod, 7, exec,$w7

bind = $mainMod, 8, workspace, name:$wH
bind = $mainMod, 8, exec,$w8

bind = $mainMod, 9, workspace, name:$wI
bind = $mainMod, 9, exec,$w9

bind = $mainMod SHIFT, 1, movetoworkspace,name:$wA

bind = $mainMod SHIFT, 2, movetoworkspace,name:$wB
bind = $mainMod SHIFT, 2, exec,$w2

bind = $mainMod SHIFT, 3, movetoworkspace,name:$wC

bind = $mainMod SHIFT, 4, movetoworkspace,name:$wD
bind = $mainMod SHIFT, 4, exec,$w4

bind = $mainMod SHIFT, 5, movetoworkspace,name:$wE
bind = $mainMod SHIFT, 5, exec,$w5

bind = $mainMod SHIFT, 6, movetoworkspace,name:$wF
bind = $mainMod SHIFT, 6, exec,$w6

bind = $mainMod SHIFT, 7, movetoworkspace,name:$wG
bind = $mainMod SHIFT, 7, exec,$w7

bind = $mainMod SHIFT, 8, movetoworkspace,name:$wH
bind = $mainMod SHIFT, 8, exec,$w8

bind = $mainMod SHIFT, 9, movetoworkspace, name:$wI
bind = $mainMod SHIFT, 9, exec,$w9

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow 
      '';

      ".config/hypr/hyprpaper.conf".text = ''
preload = ~/.config/hypr/backgrounds/disknee.jpg
preload = ~/.config/hypr/backgrounds/keyboard.png
preload = ~/.config/hypr/backgrounds/laptop_dj.jpg
preload = ~/.config/hypr/backgrounds/mario.jpg
preload = ~/.config/hypr/backgrounds/moon.jpg
preload = ~/.config/hypr/backgrounds/scifi_landscape.jpg
preload = ~/.config/hypr/backgrounds/snow-tree.jpg
preload = ~/.config/hypr/backgrounds/storage.jpg
preload = ~/.config/hypr/backgrounds/sunset-train.jpg
preload = ~/.config/hypr/backgrounds/tree_hill_snow.jpg

wallpaper = DP-1, ~/.config/hypr/backgrounds/keyboard.png
wallpaper = DP-2, ~/.config/hypr/backgrounds/scifi_landscape.jpg
wallpaper = HDMI-A-1, ~/.config/hypr/backgrounds/keyboard.png
      '';  

      ".config/waybar/config.jsonc".text = ''
{
"layer": "top",
"height": 45,
	"modules-left": ["custom/nix", "cpu", "memory", "disk"],
"modules-center": ["hyprland/workspaces"],
	"modules-right": [ "pulseaudio", "bluetooth", "network", "clock"],
	"custom/nix": {
	"format": " ",
	"tooltip": false,
	"on-click": "/run/current-system/sw/bin/wofi --show drun"
},
	"hyprland/workspaces": {
	"format": "{name} {icon}",
	"tooltip": false,
	"all-outputs": true,
	"format-icons": {
		"active": "",
		"default": ""
	},
	"on-scroll-up": "hyprctl dispatch workspace e-1",
	"on-scroll-down": "hyprctl dispatch workspace e+1",
	"on-click": "activate"
	},
	"cpu": {
		"format": "󰻠 {usage}%",
		"tooltip": true,
		"on-click": "foot sh -c 'btop'",
		"interval": 2
	},
	"memory": {
		"format": " {}%",
		"tooltip": true,
		"on-click": "foot sh -c 'btop'",
		"interval": 2
	},
	"temperature": {
		// "thermal-zone": 2,
		// "hwmon-path": "/sys/class/hwmon/hwmon2/temp1_input",
		"critical-threshold": 40,
		"format-critical": "{icon} {temperatureC}°C",
		"format": "{icon} {temperatureC}°C",
		"format-icons": [
			"",
			"",
			""
		],
		"interval": 2
	},
	"disk": {
		"format": " {percentage_used}% ({free})",
		"tooltip": true,
		"interval": 2,
		"on-click":"kitty sh -c 'ranger'"
	},
	"clock": {
		"format": "  {:%d <small>%a</small> %H:%M}",
		//"format": " {:%a %b %d %Y | %H:%M}",
		"format-alt": "  {:%A %B %d %Y (%V) | %r}",
		"tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
		"calendar-weeks-pos": "right",
		"today-format": "<span color='#f38ba8'><b><u>{}</u></b></span>",
		"format-calendar": "<span color='#f2cdcd'><b>{}</b></span>",
		"format-calendar-weeks": "<span color='#94e2d5'><b>W{:%U}</b></span>",
		"format-calendar-weekdays": "<span color='#f9e2af'><b>{}</b></span>",
		"interval": 60
	},    
	"backlight": {
	"device": "intel_backlight",
	"format": "<span color='#2da14c'>{icon}</span> {percent}%",
	"format-icons": ["", "", "", "", "", "", "", "", ""],
	"on-scroll-up": "brightnessctl set +2%",
	"on-scroll-down": "brightnessctl set 2%-",
	"interval": 2
	},
	"pulseaudio": {
		// "scroll-step": 1, // %, can be a float
		"format": "{icon} {volume}%", // {format_source}
		"format-bluetooth": "{icon} {volume}%", // {format_source}
		"format-bluetooth-muted": "󰗿", // {format_source}
		"format-muted": "", // {format_source}
		"format-source": "{volume}% ",
		"format-source-muted": "",
		"format-icons": {
			"headphone": "󰋋",
			"headset": "󰋎",
			"phone": "",
			"portable": "",
			"car": " ",
			"default": [
				"",
				"",
				" "
			]
		},
		"on-click": "pavucontrol"
	}, 
	"bluetooth": {
	"format": "<span color='#0056A3'></span> {status}",
	"format-disabled": "", // an empty format will hide the module
	"format-connected": "<span color='#0056A3'></span> {num_connections}",
	"tooltip-format": "{device_enumerate}",
	"tooltip-format-enumerate-connected": "{device_alias}   {device_address}"      
	},
	"network": {
		// "interface": "wlp2*", // (Optional) To force the use of this interface
		"format": "󰱓 {bandwidthTotalBytes}",
		"format-disconnected": "{icon} No Internet",
		"format-linked": "󰅛 {ifname} (No IP)",
		"format-alt": "󰛶 {bandwidthUpBytes} | 󰛴 {bandwidthDownBytes}",
		"tooltip-format": "{ifname}: {ipaddr}/{cidr} Gateway: {gwaddr}",
		"tooltip-format-wifi": "{icon} {essid} ({signalStrength}%)",
		"tooltip-format-ethernet": "{icon} {ipaddr}/{cidr}",
		"tooltip-format-disconnected": "{icon} Disconnected",
		"format-icons": {
			"ethernet": "󰈀",
			"disconnected": "⚠",
			"wifi": [
				"󰖪",
				""
			]
		},
		"interval": 2
	},
	"battery": {
	"states": {
			"good": 100,
			"warning": 30,
			"critical": 10
		},
	"format": "{icon} {capacity}%",
	"format-charging": " {capacity}%",
	"format-plugged": " {capacity}%",
	"format-alt": "{icon} {time}",
		// "format-good": "", // An empty format will hide the module
	"format-full": " {capacity}%",
	"format-icons": [" ", " ", " ", " ", " ", " "],
	"format-charging": "<span color='#2da14c'> </span> {capacity}%",
	"interval": 2
	},
	"custom/power": {
		"format": "{}",
		// "exec": "~/.scripts/tools/expand power",
		"exec": "echo '{\"text\":\"⏻\",\"tooltip\":\"Power\"}'",
		"return-type": "json",
		"on-click": "sudo ~/.config/wlogout/launch.sh"
	}
}
      '';    

      ".config/waybar/style.css".text = ''
* {
	font-family: 'M+1Code Nerd Font';
	font-size: 16px;
	min-height: 30px;
}

window#waybar {
	background: transparent;
}

#workspaces {
	background-color: transparent;
	color: #0d74bd;
	margin-top: 15px;
	margin-right: 15px;
	padding-top: 1px;
	padding-left: 10px;
	padding-right: 10px;
}

#custom-nix {
	background-color: transparent;
	color: #0a60ab;
	margin-top: 15px;
	margin-right: 15px;
	padding-top: 1px;
	padding-left: 10px;
	padding-right: 10px;
}

#custom-nix {
	font-size: 20px;
	margin-left: 15px;
	color: #0a60ab;
}

#workspaces button {
	background: transparent;
	color: #0d74bd;
}

#cpu, #memory, #temperature, #disk, #clock, #backlight, #pulseaudio, #bluetooth, #network, #battery, #custom-power {
	background-color: transparent;
	color: #00ba69;
	margin-top: 15px;
	padding-left: 10px;
	padding-right: 10px;
	margin-right: 15px;
}

#cpu {
	color: #FFD700;
}

#memory {
	color: #008000;
}

#disk {
	color: #A8A8A8;

}

#backlight, #bluetooth {
	color: #0056A3;
	padding-right: 5px;
	margin-right: 0
}

#network {
	color: #10a140;
	padding-left: 5px;
}

#pulseaudio {
	color: #ba23d9;
	padding-left: 5px;
}

#clock {
	color: #00ba69;
}
      '';

    };
  };
}
