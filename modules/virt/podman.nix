{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    podman-compose
    podman-tui
  ];
  virtualisation.podman = {
    enable = true;

    defaultNetwork.settings.dns_enabled = true;
  };
}
