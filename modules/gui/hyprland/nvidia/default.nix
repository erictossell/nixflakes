{ pkgs, home-manager, hyprland, username, ... }:
let
  hyprPackages = import ../pkgs { inherit pkgs; };
in
{
  imports = [ hyprland.nixosModules.default ];
  
  home-manager.users.${username} = {
    wayland.windowManager.hyprland.settings = {

      exec-once = [
        "waybar & hyprpaper & mako & dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      ];
      monitor = [       
        "DP-2,preferred,1080x400,1"
        "HDMI-A-1,preferred,3640x0,1"
        "DP-1,preferred,0x0,1,transform,3"
        "preferred,auto,auto"
      ];
      env = [
        "BROWSER,firefox"
        "XCURSOR_SIZE,24"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "GDK_BACKEND,wayland,x11"
        "QT_QPA_PLATFORM,wayland"
      ];
      input = {
        kb_layout = "us";
        follow_mouse = "1";
        touchpad = {
          natural_scroll = "no";
        };
        sensitivity = "-0.1";
      };
      general = {
        gaps_in = "5";
        gaps_out = "10";
        border_size = "2";
        "col.active_border" = "rgba(00ba69ee) rgba(ffffffee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        layout = "dwindle";
        cursor_inactive_timeout = "0";
        no_cursor_warps = "yes";
        resize_on_border = "yes";
        hover_icon_on_border = "yes";
      };
      decoration = {        
        rounding = "10";
        drop_shadow = "yes";
        shadow_range = "4";
        shadow_render_power = "3";
        "col.shadow" = "rgba(1a1a1aee)";
        active_opacity = "0.9";
        inactive_opacity = "0.85";
        fullscreen_opacity = "1.0";
        blur = {
      	  enabled = "yes";
    	  size = "8";
      	  passes = "3";
    	  new_optimizations = "true";
    	  xray = "true";
        };
      };      
      animations = {
        enabled = "yes";

        # Custom bezier curves for different feels
        bezier = [
          "snappyBezier, 0.4, 0.0, 0.2, 1.0"
          "smoothBezier, 0.25, 0.1, 0.25, 1.0"
        ];
        # New animations with custom timings and curves
        animation = [
         "windows, 1, 7, snappyBezier"
         "windowsOut, 1, 7, smoothBezier, popin 85%"
         "border, 1, 10, snappyBezier"
         "borderangle, 1, 8, smoothBezier"
         "fade, 1, 7, snappyBezier"
         "workspaces, 1, 6, smoothBezier"
        ];
      };
        
      dwindle = {
        pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = "yes"; # you probably want this
      };

      master = {
        new_is_master = "true";
      };
      gestures = {
        workspace_swipe = "off";
      };
      "device:epic-mouse-v1" = {
        sensitivity = "-0.5";
      };
      misc = {
        vrr = "0";
      };
      windowrulev2 = [
       "fullscreen,title:^(World of Warcraft)"
        "monitor:DP-2,title:^(World of Warcraft)"
      ];

      "$mainMod" = "SUPER";
      
     
      "$w2" = "hyprctl hyprpaper wallpaper \"DP-2, ~/.config/hypr/backgrounds/scifi_landscape.jpg\"";
      "$w4" = "hyprctl hyprpaper wallpaper \"DP-2, ~/.config/hypr/backgrounds/laptop_dj.jpg\"";
      "$w5" = "hyprctl hyprpaper wallpaper \"DP-2, ~/.config/hypr/backgrounds/storage.jpg\"";
      "$w6" = "hyprctl hyprpaper wallpaper \"DP-2, ~/.config/hypr/backgrounds/keyboard.png\"";
      "$w7" = "hyprctl hyprpaper wallpaper \"DP-2, ~/.config/hypr/backgrounds/snow-tree.jpg\"";
      "$w8" = "hyprctl hyprpaper wallpaper \"DP-2, ~/.config/hypr/backgrounds/moon.jpg\"";
      "$w9" = "hyprctl hyprpaper wallpaper \"DP-2, ~/.config/hypr/backgrounds/disknee.jpg\"";

      "$wA" = "Alpha";
      "$wB" = "Bravo";
      "$wC" = "Charlie";
      "$wD" = "Delta";
      "$wE" = "Echo";
      "$wF" = "Foxtrot";
      "$wG" = "Golf";
      "$wH" = "Hotel";
      "$wI" = "are ya lost bud";
      
      bind = [       
        "$mainMod, Q, exec, foot"
        "$mainMod, W, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, kitty -e ranger"
        "$mainMod, V, togglefloating"
        "$mainMod, R, exec, wofi --show drun"
        "$mainMod, P, pseudo"
        "$mainMod, J, togglesplit"
        "$mainMod, 0, exec, swaylock"
        "$mainMod, S, exec, grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%Y%m%d_%H%M%S').png"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        "$mainMod, 1, workspace, name:$wA"
        "$mainMod, 2, workspace, name:$wB"
        "$mainMod, 2, exec,$w2"

        "$mainMod, 3, workspace, name:$wC"

        "$mainMod, 4, workspace, name:$wD"
        "$mainMod, 4, exec,$w4"

        "$mainMod, 5, workspace, name:$wE"
        "$mainMod, 5, exec,$w5"

        "$mainMod, 6, workspace, name:$wF"
        "$mainMod, 6, exec,$w6"

        "$mainMod, 7, workspace, name:$wG"
        "$mainMod, 7, exec,$w7"

        "$mainMod, 8, workspace, name:$wH"
        "$mainMod, 8, exec,$w8"

        "$mainMod, 9, workspace, name:$wI"
        "$mainMod, 9, exec,$w9"

        "$mainMod SHIFT, 1, movetoworkspace,name:$wA"

        "$mainMod SHIFT, 2, movetoworkspace,name:$wB"
        "$mainMod SHIFT, 2, exec,$w2"

        "$mainMod SHIFT, 3, movetoworkspace,name:$wC"

        "$mainMod SHIFT, 4, movetoworkspace,name:$wD"
        "$mainMod SHIFT, 4, exec,$w4"

        "$mainMod SHIFT, 5, movetoworkspace,name:$wE"
        "$mainMod SHIFT, 5, exec,$w5"

        "$mainMod SHIFT, 6, movetoworkspace,name:$wF"
        "$mainMod SHIFT, 6, exec,$w6"

        "$mainMod SHIFT, 7, movetoworkspace,name:$wG"
        "$mainMod SHIFT, 7, exec,$w7"

        "$mainMod SHIFT, 8, movetoworkspace,name:$wH"
        "$mainMod SHIFT, 8, exec,$w8"

        "$mainMod SHIFT, 9, movetoworkspace, name:$wI"
        "$mainMod SHIFT, 9, exec,$w9"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];
      
      workspace = [
        "name:$wA,monitor:DP-1,default:true"
        "name:$wB,monitor:DP-2,default:true"
        "name:$wC,monitor:HDMI-A-1,default:true"
        "name:$wD,monitor:DP-2"
        "name:$wE,monitor:DP-2"
        "name:$wF,monitor:DP-2"
        "name:$wG,monitor:DP-2"
        "name:$wH,monitor:DP-2"
        "name:$wI,monitor:DP-2"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

    };
  };

  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [  ] ++ hyprPackages;

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
  };

  programs.dconf.enable = true;
  
  #services.getty.autologinUser = user; 
  services.greetd = {
  enable = true;
  settings = {
    default_session = {
        command = "Hyprland";
        user = username;
      };
    };
  };

  # Unlock with Swaylock
  security = {
    polkit.enable = true;
    pam = {
      services = {
        swaylock = {
          fprintAuth = false;
          text = ''
            auth include login
          '';
        };
        # Try to unlock keyring on login
        # Used for GPG keys and Account tokens
        login.enableKwallet = true;
      };
    };
  };
}
