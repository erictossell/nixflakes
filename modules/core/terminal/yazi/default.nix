{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [ yazi ];
  home-manager.users.${username} = _: {
    home.file = {
      ".config/yazi/theme.toml".source = ./theme.toml;
    };
  };
}
