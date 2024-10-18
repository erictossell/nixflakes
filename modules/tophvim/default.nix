{
  pkgs,
  ...
}: {

  environment.systemPackages = with pkgs; [
    sqlite
    nvim-pkg  # The default package added by the overlay
    #nvim
  ];
  
}
