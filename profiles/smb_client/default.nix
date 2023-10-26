{ pkgs, home-manager, username, ... }:
{
  environment.systemPackages = with pkgs; [ cifs-utils samba thunar ];
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

  services.gvfs.enable = true;
  # environment.systemPackages = with pkgs; [ thunar ];

  fileSystems."/home/${username}/Public" = {
    device = "//nb/public";
    fsType = "cifs";
     options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},credentials=/home/${username}/.config/samba/smb-secrets"];
  };
  fileSystems."/home/${username}/Private" = {
    device = "//nb/private";
    fsType = "cifs";
     options = let
        # this line prevents hanging on network split
        automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s";

      in ["${automount_opts},credentials=/home/${username}/.config/samba/smb-secrets"];
  };
}
