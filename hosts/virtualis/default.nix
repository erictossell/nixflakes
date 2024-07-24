{
  imports = [
    ./hardware-configuration.nix
  ];
  #----Host specific config ----
  networking.hostId = "9f81a092";

  services.xrdp = {
    enable = true;
    defaultWindowManager = "startxfce4";
    openFirewall = true;
    audio.enable = true;
  };
}
