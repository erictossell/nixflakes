# Can check the status of the service using: systemctl --user status redshift
{ config, lib, pkgs, ... }: {
 
 services.redshift = {
    enable = true;
#    provider = "manual";

    # Display temperature settings
    temperature = {
      day = 5700;
      night = 2700;
    };

    # General settings
    brightness = {
      day = "1";
      night = "0.7";
    };
    
    extraOptions = [
      "-v"
      "-m randr"
    ];
  };
}
