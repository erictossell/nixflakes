{ pkgs, username, ... }:
{
# Enable networking - available with nmcli and nmtui
  networking = {
    extraHosts = ''
      10.0.0.195 nixbox nb
      10.0.0.196 nixboard
      10.0.0.197 nixcube
      10.0.0.198 piZW0
      10.0.0.199 piZW1
    '';
  };

  fileSystems."/home/${username}/Shared/Public" = {
    device = "//nb/public";
    fsType = "cifs";
  };
 # fileSystems."/home/${username}/Shared/Private" = {
 #   device = "//nb/private";
 #   fsType = "cifs";
 # };

}
