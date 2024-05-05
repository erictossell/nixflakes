{
  pkgs,
  username,
  ...
}:
{
  imports = [
    ./1password
    ./firefox
    #./libreoffice
    #./obsidian
    #./vscode
    
  ];
  home-manager.users.${username} = {
    home.packages = with pkgs; [ ticktick ];

    programs.zathura = {
      enable = true;
    };
  };
}
