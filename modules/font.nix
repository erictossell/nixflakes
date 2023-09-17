{ pkgs, ... }:

{
  fonts = {
  	packages = [ 
	(pkgs.callPackage (import ./fonts/MplusCodeNerdFont) {})
	pkgs.noto-fonts
	pkgs.noto-fonts-cjk
	pkgs.noto-fonts-emoji
	pkgs.roboto
	];
#	enableDefaultPackages = false;
	fontconfig.defaultFonts = {
		serif = ["Roboto Serif" "Noto Color Emoji"];
		sansSerif = [ "Roboto" "Noto Color Emoji" ];
		emoji = [ "Noto Color Emoji" ];
	};
   };
}
