{ username, ... }:
{

  services.hypridle.enable = true;

  home-manager.users.${username} = _: {
    home.file = {

      ".config/hypr/hypridle.conf".text = ''
        	general {
            lock_cmd = pidof swaylock || swaylock       # avoid starting multiple hyprlock instances.
            before_sleep_cmd = loginctl lock-session    # lock before suspend.
            after_sleep_cmd = hyprctl dispatch dpms on  # to avoid having to press a key twice to turn on the display.
        }

        listener {
            timeout = 600                                 # 10min
            on-timeout = loginctl lock-session            # lock screen when timeout has passed
        }

        listener {
            timeout = 630                                 # 10.5min
            on-timeout = hyprctl dispatch dpms off        # screen off when timeout has passed
            on-resume = hyprctl dispatch dpms on          # screen on when activity is detected after timeout has fired.
        }
      '';
    };
  };
}
