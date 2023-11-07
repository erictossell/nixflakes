{ pkgs, home-manager, username, ... }:
{
  # Docker can also be run rootless
  virtualisation.docker = {
    enable = true;
  };
  
  # Enable virtual machines with qemu
  virtualisation.libvirtd = {
  	enable = true;
	allowedBridges = [ "virbr0" ];
  };
  
  virtualisation.podman = {
    enable = true;

    defaultNetwork.settings.dns_enabled = true;

  };

  # User permissions 
  users.users.${username}.extraGroups = [ "libvirtd" "docker" ];

  # Also recomended to install virt-manager in your packages if you want a GUI
  environment.systemPackages = with pkgs; [ docker-compose podman-desktop podman-tui podman-compose virt-manager virt-viewer ];
  
  home-manager.users.${username} = { pkgs, ... }: {
   dconf.settings = {
     "org/virt-manager/virt-manager/connections" = {
	      autoconnect = [ "qemu:///system" ];
	      uris = [ "qemu:///system" ];
      };
    };
  };
}
