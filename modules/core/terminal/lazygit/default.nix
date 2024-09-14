{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [ unstable.lazygit ];

}