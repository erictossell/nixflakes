{pkgs, ...}:
with pkgs; [
  eww-wayland
  grim
  hyprpaper
  hyprpicker
  mako
  slurp
  swaylock
  waybar
  wl-clipboard
  wofi 
  # Required if applications are having trouble opening links
  xdg-utils
]

