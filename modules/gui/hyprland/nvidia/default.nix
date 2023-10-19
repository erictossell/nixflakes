{ pkgs, hyprland, username, ... }:
let
  hyprPackages = import ../pkgs { inherit pkgs; };
in
{
  imports = [ hyprland.nixosModules.default ];

  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    #hyprland.packages.${system}.hyprland-nvidia
  ] ++ hyprPackages;

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
