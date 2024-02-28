{ pkgs, home-manager, username, ... }: {
  imports = [ ./dots ];
  environment.systemPackages = with pkgs; [ foot ];

}
