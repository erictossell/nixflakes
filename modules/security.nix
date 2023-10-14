{ pkgs, user, ... }:
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
      };
    };
  }; 

  services.udev.packages = [ pkgs.yubikey-personalization ];
  programs = {
    _1password.enable = true;
    _1password-gui = {
	enable = true;
	polkitPolicyOwners = [ "${user}" ];
    };
 
  gnupg.agent = {
      enable = true;
    };
  };
}

