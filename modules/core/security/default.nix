{ pkgs, username, ... }:
{ 
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
    polkit = {
      enable = true;
      debug = true;
      extraConfig = ''
        /* Log authorization checks. */
        polkit.addRule(function(action, subject) {
          polkit.log("user " +  subject.user + " is attempting action " + action.id + " from PID " + subject.pid);
        });       
     '';
    };
  }; 
  services.udev.packages = [ pkgs.yubikey-personalization ];
  programs.gnupg.agent.enable = true;
}

