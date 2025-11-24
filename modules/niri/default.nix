{ pkgs, ... }:
{
  imports = [
    ./waybar
  ];
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
    mako
    swww
    xwayland-satellite
  ];
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
    };
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}
