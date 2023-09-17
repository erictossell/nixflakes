{ config, pkgs, ... }:
{

  # Environment variables
  
  # Force wayland when possible
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Fix disappearing cursor on Hyprland
  # environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";

  # Enable NVIDIA
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  
  # Bluetooth

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Sound settings
  security.rtkit.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = false;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  
  # Printing
  # services.printing.enable = true;

  # Touchpad support (default in most desktopManagers)
  # services.xserver.libinput.enable = true;
}
