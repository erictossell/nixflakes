{ ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # ---- System Configurations ----
  # Enable my Lenovo Keyboard
  boot.kernelParams = [ "i8042.direct" "i8042.dumbkbd" "i915.force_probe=9a49"];
}
