{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    eww-wayland
    grim
    slurp
    wl-clipboard
    # Required if applications are having trouble opening links
    xdg-utils
  ];
}
