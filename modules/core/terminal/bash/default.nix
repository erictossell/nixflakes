{ pkgs, home-manager, username, ... }:
{  
   # ---- Home Configuration ----
   home-manager.users.${username} = { pkgs, ... }: {
    programs.bash.enable = true;
   };

  # ---- System Configuration ----
  programs.bash = {
    interactiveShellInit = ''
      	nitch
    '';
    shellAliases = {
	b = "btop";
	e = "exit";
	g = "git";
	n = "nvim";
	t = "tmux";
	r = "ranger";
    };
  };

}
