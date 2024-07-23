{ pkgs, username, ... }:
{
  imports = [
    ./1password
    ./firefox
    #./jetbrains
    #./libreoffice
    #./obsidian
    #./vscode
  ];
  home-manager.users.${username} = {
    home.packages = with pkgs; [ ticktick remmina ];

    programs.zathura = {
      enable = true;
    };
  };
}
