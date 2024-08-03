{ pkgs, ... }:
{
  # ---- System Configuration ----
  programs = {
    tmux = {
      enable = true;
      newSession = true;
      plugins = with pkgs.tmuxPlugins; [ yank ];
    };
  };
}
