{ pkgs, hyprland, ... }:
let
  hyprPackages = import ../pkgs/hyprland.nix { inherit pkgs; };
in
{
 
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    hyprland.packages.${system}.hyprland-nvidia
    libsForQt5.kwallet
  ] ++ hyprPackages;
  
  #Application prompts
 
  # Try to unlock keyring on login
  # Used for GPG keys and Account tokens
  

  programs.dconf.enable = true;
  
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
