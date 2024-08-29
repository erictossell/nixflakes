{ DE, ... }:
{
  imports = [
    ./agenix
    ./apps
    ./core
    ./eriixpkgs
    ./hardware
    ./${DE}
    ./stylix
    ./tailscale
    ./trunkio
  ];

  # Used for trunk-io
  programs.nix-ld.enable = true;
}
