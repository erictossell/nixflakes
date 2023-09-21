{ pkgs, home-manager, ... }:
{
  home-manager.users.eriim = { pkgs, ... }: {
     obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
	  wlrobs
	  obs-vaapi
	  obs-vkcapture
	  obs-pipewire-audio-capture
        ];
      };
    services.easyeffects.enable = true;
  };
}

