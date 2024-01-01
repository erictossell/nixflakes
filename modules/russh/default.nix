{ pkgs, russh, ... }: 
{
  environment.systemPackages = with pkgs; [
    russh.packages.${system}.russh
  ];
}
