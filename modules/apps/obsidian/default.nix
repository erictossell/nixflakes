{ pkgs, home-manager, username, ... }: {
  home-manager.users.${username} = { home.packages = with pkgs; [ obsidian ]; };

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
}
