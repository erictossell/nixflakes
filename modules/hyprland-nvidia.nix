{ pkgs, hyprland, ... }:

{
  environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    hyprland.packages.${system}.hyprland
  ];
  
  programs.dconf.enable = true;
  services.gnome = {
    evolution-data-server.enable = true;
    gnome-keyring.enable = true;
  };
}
