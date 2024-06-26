{ config, username, ... }:
{
  # Environment variables
  # ---- I often have these enabled elsewhere but you may still want these if you are having issues ----
  # Force wayland when possible
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Fix disappearing cursor on Hyprland
  # environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  # Enable NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics = {
    enable = true;
    #   driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    # https://nixos.wiki/wiki/Nvidia#Running_the_new_RTX_SUPER_on_nixos_stable
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  users.users.${username} = {
    extraGroups = [
      "video"
      "render"
    ];
  };
}
