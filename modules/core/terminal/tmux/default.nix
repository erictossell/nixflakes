{ pkgs, username, ... }:
{
  home-manager.users.${username} = _: {
    programs = {
      tmux = {
        enable = true;
        newSession = true;
        plugins = with pkgs.tmuxPlugins; [
          gruvbox
          yank
        ];
      };
    };
  };
}
