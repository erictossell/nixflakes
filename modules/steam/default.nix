{ pkgs, ... }:
{
  # Proton Experimental is pretty sweet
  programs = {
    steam.enable = true;
  };
  environment.systemPackages = with pkgs; [
    gamescope
  ];

}
