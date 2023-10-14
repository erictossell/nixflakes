{ pkgs, home-manager, user, ... }:
{
  home-manager.users.${user} = { pkgs, ... }: {

     programs = {

       obs-studio = {
          enable = true;
          plugins = with pkgs.obs-studio-plugins; [
            wlrobs
            obs-vaapi
            obs-vkcapture
            obs-pipewire-audio-capture
          ];
      };

    };
    services.easyeffects.enable = true;
  };

  environment.systemPackages = with pkgs; [ obs-studio];
}

