{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.goland
    jetbrains.rust-rover
    jetbrains.pycharm-community
  ];
}
