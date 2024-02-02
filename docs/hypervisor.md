## NixOS as a HyperVisor

NixOS can take full advantage of `kvm` and `qemu` (among other virtualization software) to virtualize secondary operating systems. 

The following is a basic configuration that allows for emulating TPM 2.0 (Windows 11), providing remote desktop connections over SPICE and some graphical tools to assist with the creation and management of VM's and their snaphots. 

```nix
  # This may already be in your hardware-configuration.nix
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
  
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  
  users.users.${username}.extraGroups = [ "libvirtd" ];

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
```
