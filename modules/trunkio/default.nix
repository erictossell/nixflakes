{
  pkgs,
  inputs,
  ...
}: {
  
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
    # LINK: https://blog.thalheim.io/2022/12/31/nix-ld-a-clean-solution-for-issues-with-pre-compiled-executables-on-nixos/
    rustc
    cargo
    unstable.trunk-io
  ];
}