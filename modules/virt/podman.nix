{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ podman-compose podman-tui podman-desktop ];
  virtualisation.podman = {
    enable = true;

    defaultNetwork.settings.dns_enabled = true;

  };
}
