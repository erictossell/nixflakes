{ config, pkgs, home-manager, username, ... }:
{
  # Enable virtual machines with qemu
  virtualisation.libvirtd = {
    enable = true;
    
    qemu = {
      package = pkgs.qemu_kvm;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [ 
          (pkgs.OVMFFull.override {
            secureBoot = true;
            tpmSupport = true;
          })
        ];
      };
    };
  };
  
  # User permissions 
  users.users.${username}.extraGroups = [ "libvirtd" ];

  # Also recomended to install virt-manager in your packages if you want a GUI
  environment.systemPackages = with pkgs; [ OVMF virt-manager virt-viewer ];
  environment.etc = {
    "ovmf/edk2-x86_64-secure-code.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-x86_64-secure-code.fd";
    };

    "ovmf/edk2-i386-vars.fd" = {
      source = config.virtualisation.libvirtd.qemu.package + "/share/qemu/edk2-i386-vars.fd";
    };
  };

  home-manager.users.${username} = { pkgs, ... }: {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
	      autoconnect = [ "qemu:///system" ];
	      uris = [ "qemu:///system" ];
      };
    };
  };
}
