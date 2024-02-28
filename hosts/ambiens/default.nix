{ nixpkgs, ... }: {
  imports = [
    (nixpkgs + "/nixos/modules/virtualisation/qemu-guest-agent.nix")
    ./hardware-configuration.nix
  ];
  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/vda";
      useOSProber = true;
      enableCryptodisk = true;
    };
  };
  boot.initrd.secrets = { "/crypto_keyfile.bin" = null; };

  services = {
    spice-autorandr.enable = true;
    spice-vdagentd.enable = true;
    spice-webdavd.enable = true;
  };

}
