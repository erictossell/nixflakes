{ DE, ... }:
{
  imports = [
    ./agenix
    ./apps
    ./core
    ./eriixpkgs
    ./tophpkgs
    ./hardware
    ./${DE}
    ./stylix
    ./tailscale
    ./trunkio
  ];

  # Used for trunk-io
  # programs.nix-ld.enable = true;
}
