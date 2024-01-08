{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ swaylock ];
  # Unlock with Swaylock
  security = {
    pam = {
      services = {
        swaylock = {
          fprintAuth = false;
          text = ''
            auth include login
          '';
        };
      };
    };
  };

  home-manager.users.${username} = {
    home.file = {
      ".config/swaylock/background.jpg".source = ./nix-wallpaper-dracula.png;

      ".config/swaylock/config".text = ''
        # indicator
        # no-unlock-indicator
        # daemonize
        ignore-empty-password

        #clock
        #timestr=%R
        #datestr=%a, %e of %B

        indicator-caps-lock
        # datestr=%A
        image=~/.config/swaylock/background.jpg
        scaling=fill
        font=monospace term
        font-size=25

        # Ring
        indicator-radius=250
        indicator-thickness=75
        # line-uses-ring
        line-color=#3b4252
        text-color=#d8dee9
        inside-color=#2e344098
        inside-ver-color=#5e81ac
        line-ver-color=#5e81ac
        ring-ver-color=#5e81ac98
        ring-color=#4c566a
        key-hl-color=#5e81ac
        separator-color=#4c566a
        layout-text-color=#eceff4
        line-wrong-color=#d08770
      '';
    };
  };
}
