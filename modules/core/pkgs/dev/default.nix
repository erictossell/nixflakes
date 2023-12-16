{ pkgs, ... }:
with pkgs; [
  cargo
  go
  nim
  nix-melt
  nix-prefetch-git
  nixpacks
  powershell
  postgresql_15
  python312
  railway
  zig
]

