{ pkgs, home-manager, username, ... }:
{
  # Enable virtual machines with qemu
  virtualisation.libvirtd = {
  	enable = true;
	allowedBridges = [ "virbr0" ];
  };
  
  # User permissions 
  users.users.${username}.extraGroups = [ "libvirtd" ];

  # Also recomended to install virt-manager in your packages if you want a GUI
  environment.systemPackages = with pkgs; [ virt-manager virt-viewer ];
  
  home-manager.users.${username} = { pkgs, ... }: {
   dconf.settings = {
     "org/virt-manager/virt-manager/connections" = {
	      autoconnect = [ "qemu:///system" ];
	      uris = [ "qemu:///system" ];
      };
    };
  };
}
