{ DE, ... }:
{
  imports = [
    ./agenix
    ./apps
    ./core
    #./eriixpkgs
    ./tophvim
    ./hardware
    ./${DE}
    ./stylix
    ./tailscale
    ./trunkio
    ./redshift   
    #./nixcats
  ];

  # Used for trunk-io
  # programs.nix-ld.enable = true;
}
