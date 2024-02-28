{ pkgs, username, ... }: {
  security = {
    pam = {
      # Auth with FIDO Keys
      # Documentation is available on the NixOS wiki.
      # https://nixos.wiki/wiki/Yubikey
      u2f.enable = true;
      services = {
        # Sign in with YubiKey
        login.u2fAuth = true;
        # Sudo with Yubikey
        sudo.u2fAuth = true;
      };
    };
  };
  services.udev.packages = [ pkgs.yubikey-personalization ];
}
