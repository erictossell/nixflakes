{
  imports = [ ./hardware-configuration.nix ];
  #----Host specific config ----
  boot.kernelParams = [
    "i8042.direct"
    "i8042.dumbkbd"
    "i915.force_probe=9a49"
  ];
  # ---- System Configurations ----
  powerManagement.powertop.enable = true;
  services.thermald.enable = true;
}
