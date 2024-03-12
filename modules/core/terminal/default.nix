{ pkgs, home-manager, username, ... }: {
  imports = [ ./bash ./cava ./fonts ./foot ./nvim ./starship ./tmux ];

  # ---- Home Configuration ----
  home-manager.users.${username} = {
    programs.git.enable = true;
    programs.vim.enable = true;
  };

  # ---- System Configuration ----
  programs = {
    htop.enable = true;
    mtr.enable = true;
  };

  environment.systemPackages = with pkgs; [
    alacritty
    brightnessctl
    btop
    gh
    nitch
    pavucontrol
    playerctl
    ripgrep
    todoist
    unzip
    wget
  ];
}
