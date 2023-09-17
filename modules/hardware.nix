{ config, pkgs, ... }:
{
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
