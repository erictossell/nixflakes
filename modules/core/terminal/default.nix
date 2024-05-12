{ pkgs, username, ... }:
{
  imports = [
    ./cava
    ./fonts
    ./foot
    ./nvim
    ./starship
    ./tmux
    ./zsh
  ];

  # ---- Home Configuration ----
  home-manager.users.${username} = {
    programs.git.enable = true;
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
    mods
    nitch
    pavucontrol
    playerctl
    ripgrep
    todoist
    unzip
    vhs
    wishlist
    zoxide
  ];
}
