{
  imports = [ ./hardware-configuration.nix ];
  #----Host specific config ----
  networking.hostId = "9f81a092";

  services.xrdp = {
    enable = true;
    #defaultWindowManager = "i3";
    openFirewall = true;
    audio.enable = true;
  };
  services.spice-vdagentd.enable = true;
  services.qemuGuest.enable = true;
}
