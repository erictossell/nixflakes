{ pkgs, username, ... }:
{ 
  security = {       
    pam = {
      # Auth with FIDO Keys
      # Do not enable this until you have added your security keys to your machine.
      # Documentation is available on the NixOS wiki.
      u2f.enable = true;
      services = {
        # Sign in with YubiKey
        login.u2fAuth = true;
        # Sudo with Yubikey
        sudo.u2fAuth = true;
        
        login.enableGnomeKeyring = true;
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
  services.gnome = {
    gnome-keyring.enable = true;
  };
  services.udev.packages = [ pkgs.yubikey-personalization ];
  programs.gnupg.agent.enable = true;
}

