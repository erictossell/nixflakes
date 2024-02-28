{ home-manager, username, ... }: {
  home-manager.users.${username} = _: {
    home.file = {

      ".config/hypr/vol.sh" = {
        source = ../../../sh/vol.sh;
        executable = true;
      };

      ".config/hypr/toggle_waybar.sh" = {
        source = ../../../sh/toggle_waybar.sh;
        executable = true;
      };

      ".config/hypr/hyprland.conf".text = ''
                monitor=DP-2,preferred,1080x400,1
                monitor=HDMI-A-1,preferred,3640x400,1
                monitor=DP-1,preferred,0x0,1,transform,3
                monitor=,preferred,auto,auto

                exec-once = swww init & swww img ~/.config/backgrounds/porthole.jpg & mako & lxqt-policykit-agent & dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

                # some default env vars.
                env=BROWSER,firefox
                env=XCURSOR_SIZE,24

                env=XDG_CURRENT_DESKTOP,Hyprland
                env=XDG_SESSION_DESKTOP,Hyprland
                env=XDG_SESSION_TYPE,wayland

                env=GDK_BACKEND,wayland,x11
                env=MOZ_ENABLE_WAYLAND,1
                env=MOZ_DISABLE_RDD_SANDBOX,1

                env=QT_AUTO_SCREEN_SCALE_FACTOR,1
                env=QT_QPA_PLATFORM,wayland


                $mainMod = SUPER

                bind = $mainMod, q, exec, foot 
                bind = $mainMod, w, killactive, 
                bind = $mainMod, f, fullscreen, 1
                bind = $mainMod, a, exec, pavucontrol
        	bind = $mainMod, v, exec, foot -e nvim
                bind = $mainMod, 0, exit, 
                bind = $mainMod, e, exec, thunar
                bind = $mainMod, b, exec, foot -e btop
        	bind = $mainMod, t, exec, foot -e tmux
        	bind = $mainMod, g, exec, foot -e firefox
                bind = $mainMod, c, togglefloating, 
                bind = $mainMod, r, exec, wofi --show drun
                bind = $mainMod, p, pseudo, # dwindle
                bind = $mainMod, j, togglesplit, # dwindle
                bind = $mainMod, l, exec, swaylock
                bind = $mainMod, o, exec, bash -i ~/.config/hypr/toggle_waybar.sh
                bind = $mainMod, s, exec, grim -g "$(slurp)" ~/Pictures/Screenshots/$(date +'%Y%m%d_%H%M%S').png

                bind = ,XF86AudioMute, exec, ~/.config/hypr/vol.sh --mute
                bind = ,XF86AudioLowerVolume, exec, ~/.config/hypr/vol.sh --down
                bind = ,XF86AudioRaiseVolume, exec, ~/.config/hypr/vol.sh --up

                bind = ,xF86AudioPlay, exec, playerctl play-pause
                bind = ,xF86AudioNext, exec, playerctl next
                bind = ,xF86AudioPrev, exec, playerctl previous

                $w2 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/backgrounds/porthole.jpg"
                $w4 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/backgrounds/1A1C23.png"
                $w5 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/backgrounds/storage.jpg"
                $w6 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/backgrounds/keyboard.png"
                $w7 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/backgrounds/232136.png"
                $w8 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/backgrounds/232136.png"
                $w9 = hyprctl hyprpaper wallpaper "DP-2, ~/.config/backgrounds/232136.png"

                $wA = Alpha
                $wB = Bravo
                $wC = Charlie
                $wD = Delta
                $wE = Echo
                $wF = Foxtrot
                $wG = Golf
                $wH = Hotel
                $wI = are ya lost bud


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
                	col.active_border = rgba(0D599Fee) rgba(ffffffee) 45deg
                	col.inactive_border = rgba(595959aa)
                	layout = dwindle
                	cursor_inactive_timeout = 15
                	no_cursor_warps = yes
                }

                decoration {
                	rounding = 10
                	drop_shadow = yes
                	shadow_range = 4
                	shadow_render_power = 3
                	col.shadow = rgba(1a1a1aee)
                	active_opacity = 1.0
                	inactive_opacity = 1.0
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
                	animation = windows, 1, 7, smoothBezier, slide
                	animation = windowsOut, 1, 7, snappyBezier, slide
                	animation = border, 1, 10, snappyBezier
                	animation = borderangle, 1, 100, smoothBezier, loop
                	animation = fade, 1, 7, smoothBezier
                	animation = workspaces, 1, 6, smoothBezier, slidefadevert 20%
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

                misc {
                	disable_hyprland_logo = true
                	enable_swallow = true
                	swallow_regex = ^(foot)$
                	background_color = 0x232136
                }

                windowrulev2 = stayfocused, title:^()$,class:^(steam)$
                windowrulev2 = minsize 1 1, title:^()$,class:^(steam)$

                bind = $mainMod, left, movefocus, l
                bind = $mainMod, right, movefocus, r
                bind = $mainMod, up, movefocus, u
                bind = $mainMod, down, movefocus, d

                bind = $mainMod shift, left, movewindow, l
                bind = $mainMod shift, right, movewindow, r
                bind = $mainMod shift, up, movewindow, u
                bind = $mainMod shift, down, movewindow, d

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

    };
  };
}
