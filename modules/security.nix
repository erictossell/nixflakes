{ pkgs, ... }:
{ 
  security = {
    #Application prompts
    polkit.enable = true;
    
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

        # Try to unlock keyring on login
	# Used for GPG keys and Account tokens
	login.enableGnomeKeyring = true;
      };
    };
  };  

  programs = {
    _1password.enable = true;
    _1password-gui = {
	enable = true;
	polkitPolicyOwners = [ "eriim" ];
    };

  gnupg.agent = {
      enable = true;
    };
  };
}

