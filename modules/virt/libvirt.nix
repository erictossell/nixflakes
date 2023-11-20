{ config, pkgs, home-manager, username, ... }:
{
  # Enable virtual machines with qemu
  virtualisation.libvirtd = {
    enable = true;
    
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
      ovmf.enable = true;
      ovmf.packages = [ pkgs.OVMFFull.fd ];
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;  
  
  # User permissions 
  users.users.${username}.extraGroups = [ "libvirtd" ];

  # Also recomended to install virt-manager in your packages if you want a GUI
  environment.systemPackages = with pkgs; [ 
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer 
    win-virtio
    win-spice
  ];

  home-manager.users.${username} = { pkgs, ... }: {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
	      autoconnect = [ "qemu:///system" ];
	      uris = [ "qemu:///system" ];
      };
    };
  };
}
