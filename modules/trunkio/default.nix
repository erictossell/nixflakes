{
  pkgs,
  inputs,
  outputs,
  ...
}: {

  environment.systemPackages = with pkgs; [
    unstable.trunk-io
  ];

  # # Need to use nix-ld because trunk-io is a dynamically linked binary
  # programs.nix-ld.libraries = with pkgs; [
  #   # LINK: https://blog.thalheim.io/2022/12/31/nix-ld-a-clean-solution-for-issues-with-pre-compiled-executables-on-nixos/
  #   rustc
  #   cargo
  #   trunk-io
  # ];
}