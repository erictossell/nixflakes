{ pkgs, username, ... }:
{
  imports = [
    #./1password
    ./firefox
    ./gitkraken
    #./jetbrains
    #./libreoffice
    #./obsidian
    ./vscode
    ./spotify
  ];
  
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      ticktick
      remmina
    ];

    programs.zathura = {
      enable = true;
    };
  };
}
