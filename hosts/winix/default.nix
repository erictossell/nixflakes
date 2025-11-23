{
  username,
  hostName,
  NixOS-WSL,
  ...
}:

{
  imports = [ NixOS-WSL.nixosModules.wsl ];
  wsl = {
    enable = true;
    defaultUser = "${username}";
  };

  networking.hostName = "${hostName}";
}
