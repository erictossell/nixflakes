{ pkgs, ... }: {
  # ---- System Configuration ----
  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      newSession = true;
      plugins = with pkgs.tmuxPlugins; [ catppuccin yank ];
    };
  };

}
