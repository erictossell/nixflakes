{ ... }:
{

  # Desktop specific programs
  programs = {

    chromium = {
	enable = true;
	extraOpts = {
	  "BrowserSignin" = 1;
	  "SyncDisabled" = false;
	  "PasswordManagerEnabled" = false;
	  "SpellcheckEnabled" = true;
	  "SpellcheckLanguage" = [ "en-US" ];
	  };
	extensions = [
	  "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
	  "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1password
	];
    };

    steam.enable = true;
  
  };
}
