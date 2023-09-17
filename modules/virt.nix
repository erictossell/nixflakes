{ pkgs, ... }:
{

  virtualisation.docker = {
    enable = true;
  };
  
  # Requires dconf.settings in Home-manager
  # Also recomended to install virt-manager in home-manager
  virtualisation.libvirtd.enable = true;

  services.qemuGuest.enable = true;
  
  users.users.eriim.extraGroups = [ "libvirtd" "docker" ];

}
