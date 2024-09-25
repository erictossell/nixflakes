{
  imports = [ ./hardware-configuration.nix ];
  #----Host specific config ----
  boot.kernelParams = [
    "i8042.direct"
    "i8042.dumbkbd"
    "i915.force_probe=9a49"
  ];
  # ---- System Configurations ----
  powerManagement.powertop.enable = false;
  #powerManagement.enable = false;
  services.thermald.enable = true;

  # # Remove the auto suspending of USB
  # # LINK: https://discourse.nixos.org/t/nixos-power-management-help-usb-doesnt-work/9933/4
  # services.tlp.extraConfig = ''
  #   USB_AUTOSUSPEND=0
  #   RUNTIME_PM_BLACKLIST="06:00.3 06:00.4"
  #   '';
}
