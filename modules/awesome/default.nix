{ pkgs, ... }:
{
  services.xserver = {
    enable = true;

    #displayManager = {
    #    sddm.enable = true;
    #    defaultSession = "none+awesome";
    #};

    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];

    };
  };

}
