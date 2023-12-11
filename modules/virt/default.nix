{
  imports = [
    ./docker.nix
    ./libvirt.nix
    ./podman.nix
  ];
  virtualisation.vmVariant = {
    virtualisation = {
      memorySize = 4096;
      cores = 2;
    };
  };
}
