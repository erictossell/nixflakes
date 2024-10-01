{
  tophvim,
  pkgs,
  ...
}: {

  nixpkgs.overlays = [
    tophvim.overlays.default
  ];

  environment.systemPackages = with pkgs; [
    nvim-pkg # The default package added by the overlay
  ];
}
