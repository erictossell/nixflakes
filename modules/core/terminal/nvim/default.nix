{ tophpkgs, system, ... }:
{
  environment.variables.EDITOR = "nvim";
  environment.systemPackages = [ tophpkgs.packages.${system}.tophvim ];
}