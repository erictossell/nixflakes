{ username, ... }: {
  services.tailscale = {
    enable = true;
    extraUpFlags = [ "--shields-up" "--operator=${username}" ];
  };
}
