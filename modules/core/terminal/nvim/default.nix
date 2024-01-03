{ pkgs, eriixvim, system, ... }:
{
  environment.systemPackages = with pkgs; [
    eriixvim.packages.${system}.default
  ];
}
