# https://www.reddit.com/r/NixOS/comments/1bn3mdf/comment/kwmk4ii/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
{
  config,
  pkgs,
  ...
}: {
  boot.kernelModules = [
    "v4l2loopback" # Webcam loopback
  ];
  boot.extraModulePackages = [
    pkgs.linuxPackages.v4l2loopback # Webcam loopback
  ];

  # Droidcam uses port 4747
  networking.firewall.allowedTCPPorts = [ 4747 ];
  networking.firewall.allowedUDPPorts = [ 4747 ];

  programs.adb.enable = true; # enable android proper data tethering

  environment.systemPackages = with pkgs; [
    # Webcam packages
    v4l-utils
    android-tools
    adb-sync
    unstable.droidcam   # android webcam
    scrcpy              # screen copy for android
  ];
}