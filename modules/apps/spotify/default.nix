{
  inputs,
  outputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    spotify
  ];

  # Expose certain ports
  # LINK: https://nixos.wiki/wiki/Spotify
  networking.firewall.allowedTCPPorts = [ 57621 ];
  networking.firewall.allowedUDPPorts = [ 5353 ];

}