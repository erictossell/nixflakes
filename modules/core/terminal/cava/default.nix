{ pkgs, ... }:
{
  imports = [ ./dots ];
  environment.systemPackages = with pkgs; [ cava ];
}
