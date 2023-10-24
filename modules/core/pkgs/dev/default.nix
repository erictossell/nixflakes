{ pkgs, ... }:
with pkgs; [
  cargo
  gcc
  cmake
  gnumake
  go
  nim
  nix-prefetch-git
  nodejs_20
  powershell
  python312
  zig
]

