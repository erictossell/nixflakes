{ pkgs, username, ... }:
{
  imports = [
    ./1password
    ./firefox
    #./jetbrains
    #./libreoffice
    ./obsidian
    #./vscode
  ];
  home-manager.users.${username} = {
    programs.chromium = {
      enable = true;
      package = pkgs.brave;   
    };
    home.packages = with pkgs; [
      microsoft-edge
      ticktick
      remmina
      openvpn
      vivaldi
      vscode
    ];

    programs.zathura = {
      enable = true;
    };
  };
}
