{ pkgs, eriixvim,  ... }:
{
  environment.systemPackages = with pkgs; [
    eriixvim.packages.x86_64-linux.default
  ];
}
