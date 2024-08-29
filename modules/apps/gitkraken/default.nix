{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    unstable.gitkraken
  ];
}
