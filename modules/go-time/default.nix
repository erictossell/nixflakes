{ pkgs, go-time, ... }:
{
  environment.systemPackages = with pkgs; [
    go-time.packages.${system}.default
  ];
}
