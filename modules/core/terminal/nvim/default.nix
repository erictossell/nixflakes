{
  pkgs,
  home-manager,
  username,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    neovim
    libgcc
    zig
    unstable.luarocks-nix
  ];
  environment.variables.EDITOR = "nvim";

  home-manager.users.${username} = _: {
    home.file = {
      ".config/nvim/init.lua".source = ./init.lua;
    };
  };
}