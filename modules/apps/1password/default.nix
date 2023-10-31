{ pkgs, home-manager, username, ... }:
{ 
   home-manager.users.${username} = { pkgs, ... }: {
    home.file = {
      ".ssh/config".text = ''
Host *
  IdentityAgent ~/.1password/agent.sock
      '';
     };
   };
   programs.bash.interactiveShellInit = ''
source /home/eriim/.config/op/plugins.sh
   '';
   programs = {
    _1password.enable = true;
    _1password-gui = {
	enable = true;
	polkitPolicyOwners = [ "${username}" ];
    }; 
    #chromium = {
	#extensions = [
	  #"aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
      #];
    #};
  };


}

