{ home-manager, username, ... }:
{
  home-manager.users.${username} =  { ... }: {
    home.file = {
      ".config/hypr/backgrounds".source = ../backgrounds;

      ".config/hypr/hyprland.conf".text = ''
#monitor=edp-1,3840 x 2160,auto,auto
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
	follow_mouse = 0
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
	active_opacity = 0.9
	inactive_opacity = 0.85
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
	bezier = snappybezier, 0.4, 0.0, 0.2, 1.0
	bezier = smoothbezier, 0.25, 0.1, 0.25, 1.0
	animation = windows, 1, 7, snappybezier
	animation = windowsOut, 1, 7, snappybezier, popin 85%
	animation = border, 1, 10, snappybezier
	animation = borderangle, 1, 8, smoothbezier
	animation = fade, 1, 7, smoothbezier
	animation = workspaces, 1, 6, smoothbezier
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

$mainmod = SUPER

bind = $mainmod, q, exec, foot 
bind = $mainmod, w, killactive, 
bind = $mainmod, m, exit, 
bind = $mainmod, e, exec, kitty -e ranger
bind = $mainmod, v, togglefloating, 
bind = $mainmod, r, exec, wofi --show drun
bind = $mainmod, p, pseudo, # dwindle
bind = $mainmod, j, togglesplit, # dwindle
bind = $mainmod, 0, exec, swaylock
bind = $mainmod, s, exec, grim -g "$(slurp)" ~/pictures/screenshots/$(date +'%y%m%d_%h%m%s').png

bind = $mainmod, left, movefocus, l
bind = $mainmod, right, movefocus, r
bind = $mainmod, up, movefocus, u
bind = $mainmod, down, movefocus, d

bind = $mainmod SHIFT, left, movewindow, l
bind = $mainmod SHIFT, right, movewindow, r
bind = $mainmod SHIFT, up, movewindow, u
bind = $mainmod SHIFT, down, movewindow, d


$w1 = hyprctl hyprpaper wallpaper "eDP-1, ~/.config/hypr/backgrounds/keyboard.png"
$w2 = hyprctl hyprpaper wallpaper "eDP-1, ~/.config/hypr/backgrounds/storage.jpg"
$w3 = hyprctl hyprpaper wallpaper "eDP-1, ~/.config/hypr/backgrounds/scifi_landscape.jpg"
$w4 = hyprctl hyprpaper wallpaper "eDP-1, ~/.config/hypr/backgrounds/keyboard.png"
$w5 = hyprctl hyprpaper wallpaper "eDP-1, ~/.config/hypr/backgrounds/storage.jpg"
$w6 = hyprctl hyprpaper wallpaper "eDP-1, ~/.config/hypr/backgrounds/scifi_landscape.jpg"
$w7 = hyprctl hyprpaper wallpaper "eDP-1, ~/.config/hypr/backgrounds/keyboard.png"

$wa = Alpha
$wb = Bravo
$wc = Charlie
$wd = Delta
$we = Echo
$wf = Foxtrot
$wg = Golf
$wh = Hotel
$wi = Are ya lost bud

workspace=name:$wa,monitor:eDP-1,default:true
workspace=name:$wb,monitor:eDP-1
workspace=name:$wc,monitor:eDP-1
workspace=name:$wd,monitor:eDP-1
workspace=name:$we,monitor:eDP-1
workspace=name:$wf,monitor:eDP-1
workspace=name:$wg,monitor:eDP-1
workspace=name:$wh,monitor:eDP-1
workspace=name:$wi,monitor:eDP-1

bind = $mainmod, 1, workspace, name:$wa
bind = $mainmod, 1, exec,$w1

bind = $mainmod, 2, workspace, name:$wb
bind = $mainmod, 2, exec,$w2

bind = $mainmod, 3, workspace, name:$wc
bind = $mainmod, 3, exec,$w3

bind = $mainmod, 4, workspace, name:$wd
bind = $mainmod, 4, exec,$w4

bind = $mainmod, 5, workspace, name:$we
bind = $mainmod, 5, exec,$w5

bind = $mainmod, 6, workspace, name:$wf
bind = $mainmod, 6, exec,$w6

bind = $mainmod, 7, workspace, name:$wg
bind = $mainmod, 7, exec,$w7

bind = $mainmod, 8, workspace, name:$wh

bind = $mainmod, 9, workspace, name:$wi

bind = $mainmod SHIFT, 1, movetoworkspace,name:$wa
bind = $mainmod SHIFT, 1, exec,$w1

bind = $mainmod SHIFT, 2, movetoworkspace,name:$wb
bind = $mainmod SHIFT, 2, exec,$w2

bind = $mainmod SHIFT, 3, movetoworkspace,name:$wc
bind = $mainmod SHIFT, 3, exec,$w3

bind = $mainmod SHIFT, 4, movetoworkspace,name:$wd
bind = $mainmod SHIFT, 4, exec,$w4

bind = $mainmod SHIFT, 5, movetoworkspace,name:$we
bind = $mainmod SHIFT, 5, exec,$w5

bind = $mainmod SHIFT, 6, movetoworkspace,name:$wf
bind = $mainmod SHIFT, 6, exec,$w6

bind = $mainmod SHIFT, 7, movetoworkspace,name:$wg
bind = $mainmod SHIFT, 7, exec,$w7

bind = $mainmod SHIFT, 8, movetoworkspace,name:$wh

bind = $mainmod SHIFT, 9, movetoworkspace, name:$wi

bind = $mainmod, mouse_down, workspace, e+1
bind = $mainmod, mouse_up, workspace, e-1

bindm = $mainmod, mouse:272, movewindow
bindm = $mainmod, mouse:273, resizewindow
      '';

      ".config/hypr/hyprpaper.conf".text = ''
preload = ~/.config/hypr/backgrounds/keyboard.png
preload = ~/.config/hypr/backgrounds/scifi_landscape.jpg
preload = ~/.config/hypr/backgrounds/storage.jpg

wallpaper = eDP-1, ~/.config/hypr/backgrounds/keyboard.png
      '';  
    };
  };
}
