{ pkgs, home-manager, username, ... }: {
  imports = [
    ./1password
    ./browsing
    #./libreoffice
    #./obsidian
    #./vscode
    ./zathura
  ];
}
