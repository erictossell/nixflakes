{
  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = "plasmawayland";
    };
    desktopManager.plasma5.enable = true;
  };
}
