{ pkgs, eriixvim, system, ... }:
{
  environment.variables.EDITOR = "nvim";
  environment.systemPackages = with pkgs; [
    eriixvim.packages.${system}.default
  ];
}
