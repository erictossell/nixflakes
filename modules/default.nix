{ DE, ... }:
{
  imports = [
    ./agenix
    ./apps
    ./core
    ./hardware
    ./${DE}
    ./stylix
    ./tailscale
    ./trunkio
    ./redshift   
  ];

  # Used for trunk-io
  # programs.nix-ld.enable = true;
}
