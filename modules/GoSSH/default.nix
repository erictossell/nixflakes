{ pkgs, GoSSH, ... }: 
{
  environment.systemPackages = with pkgs; [
    GoSSH.packages.${system}.GoSSH
  ];
}
