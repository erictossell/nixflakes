{ pkgs, home-manager, username, ... }: {
  home-manager.users.${username} = { home.packages = with pkgs; [ zathura ]; };
}
