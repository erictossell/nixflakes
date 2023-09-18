{ pkgs, home-manager, ... }:
{
  home-manager.users.eriim = { pkgs, ... }: {
   dconf.settings = {
     "org/virt-manager/virt-manager/connections" = {
	autoconnect = [ "qemu:///system" ];
	uris = [ "qemu:///system" ];
      };
    };
  };

  virtualisation.docker = {
    enable = true;
  };
  
  # Requires dconf.settings in Home-manager
  # Also recomended to install virt-manager in home-manager
  virtualisation.libvirtd.enable = true;

  services.qemuGuest.enable = true;
  
  users.users.eriim.extraGroups = [ "libvirtd" "docker" ];

}
