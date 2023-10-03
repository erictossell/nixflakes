{ pkgs, home-manager, user, ... }:
{
  # Docker can also be run rootless
  virtualisation.docker = {
    enable = true;
  };
  
  # Enable virtual machines with qemu
  virtualisation.libvirtd.enable = true;
  
  # For advanced features
  services.qemuGuest.enable = true;
  
  # User permissions 
  users.users.eriim.extraGroups = [ "libvirtd" "docker" ];

  # Also recomended to install virt-manager in your packages if you want a GUI
  environment.systemPackages = with pkgs; [ virt-manager ];
  home-manager.users.${user} = { pkgs, ... }: {
   dconf.settings = {
     "org/virt-manager/virt-manager/connections" = {
	autoconnect = [ "qemu:///system" ];
	uris = [ "qemu:///system" ];
      };
    };
  };
}
