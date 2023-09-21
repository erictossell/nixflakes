{ pkgs, hyprland, ... }:
let
  hyprPackages = import ../packages/hyprland.nix { inherit pkgs; };
in
{
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    hyprland.packages.${system}.hyprland
  ] ++ hyprPackages;

  # ---- System Configuration ----
  programs.dconf.enable = true;
  services.gnome = {
    gnome-keyring.enable = true;
  };
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
  
}
