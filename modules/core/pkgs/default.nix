{ pkgs, ... }:
let
  corePackages = import ./core { inherit  pkgs; };
  devPackages = import ./dev { inherit pkgs; };
in 
{
  environment.systemPackages = corePackages ++ devPackages;
}
