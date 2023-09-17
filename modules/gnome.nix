{ pkgs, ... }:
{
  #Gnome Requires Home-manager config as well

  services.xserver.desktopManager.gnome.enable=true;
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  programs.enable.dconf = true;
  services.gnome = {
    evolution-data-server.enable = true;
    gnome-online-accounts.enable = false;
    gnome-keyring.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    ]) ++ (with pkgs.gnome; [
    gnome-music
    gedit
    epiphany
    geary
    evince
    gnome-characters
    totem
    tali
    iagno
    hitori
    atomix
  ]);

}
