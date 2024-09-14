{
  pkgs,
  home-manager,
  username,
  ...
}:
{
  environment.systemPackages = with pkgs; [ neovim ];
  environment.variables.EDITOR = "nvim";

  home-manager.users.${username} = _: {
    home.file = {
      ".config/nvim/init.lua".source = ./init.lua;
    };
  };
}