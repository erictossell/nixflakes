let
  eriim = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICf9yCa8EJijUL3553emnttHsY4Wm9mY0//p+he/LEzJ";
  users = [ eriim ];
in
{
  "tailscale.age".publicKeys = users;
}
