## NixOS Minimal Install (Mini Guide)
You've loaded NixOS on a live USB to do a minimal install because the GUI is no fun, what now?

### 1. Connect to the Internet

   a. Discover your wireless interface if you're not using ethernet.

   ```bash
      ip link show
   ```

   b. Initialise your `wpa_supplicant` with one of the following, run these commands with sudo privileges:

   ```bash
      wpa_supplicant -B -i (your-interface-name) -c <(wpa_passphrase "SSID" "password")
   ```

   OR - in the default NixOS installation home directory

   ```bash
      wpa_passphrase "SSID" "password" > temp_wpa.conf

      wpa_supplicant -B -i (your-interface-name) -c ~/temp_wpa.conf
   ```

   `pkill wpa_supplicant` between any failed attempts to connect to the internet. Remember to `rm temp_wpa.conf` after successfully connecting.

### 2. Generate Your Hardware Specific .nix

   a. Generate a basic configuration.nix and hardware-configuration.nix

   ```bash
      nixos-generate-config
   ```

   b. Edit your configuration.nix with nano or wget a configuration.nix from the internet *at your own risk*.

   - Make sure to include a user and an internet connection method.
   - Add your preferred text editor to the pkgs list.
   - (Optionally) Add any programs and services you know you will need from the get go. There is no need to incrementally build your system but it's easier to figure out what's going wrong if you go slow.
   - Save your changes.

### 3. `nixos-rebuild boot` To Launch NixOS for the First time

