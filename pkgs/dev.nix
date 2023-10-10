{ pkgs, ... }:
with pkgs; [
  cargo
  gcc
  cmake
  gnumake
  go
  nim
  nix-prefetch-git
  powershell
  python312
  zig
]

