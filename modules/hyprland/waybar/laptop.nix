{ home-manager, username, ... }: {
  home-manager.users.${username} = _: {
    home.file = {
      ".config/waybar/config.jsonc".text = ''
        {
        "layer": "top",
        "height": 45,
        	"modules-left": ["custom/nix", "cpu", "memory", "disk"],
        "modules-center": ["hyprland/workspaces"],
        	"modules-right": [ "pulseaudio", "backlight", "network", "battery", "clock"],
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
        		"interface": "wlp*",
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
