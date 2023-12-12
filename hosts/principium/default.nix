{
  imports = [
    ./hardware-configuration.nix
  ];
  #----Host specific config ----
  services.gvfs = {
    enable = true;
  };
}
