{ pkgs, ... }:
{
  imports = [ ./dots ];
  environment.systemPackages = with pkgs; [ foot ];
}
