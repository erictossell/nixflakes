## How to use this repo
Requirements: NixOS, x86_64

   1. `git clone https://github.com/erictossell/nixflakes.git`

   2. `cd nixflakes`

   3. `scripts/build.sh`

      a. Enter a new hostname

      b. If you have an existing `hardware-configuration.nix` stored in `/etc/nixos` the script will as if you would like to import it. If you have not generated one yet it will do so for you and then import it.

      c. Validate that your `hardware-configuration.nix` imported succesfully.
   
   4. Rename my user or create your own inside of `/users`.
   
   5. Add your system configuration to the flake.nix.

      *username*: Must be the same as the new user you created in `/users`.

      *hostname*: Must be the same as the new directory created in `/hosts`.

      *displayConfig*: (1monitor | 3monitor) Import display specific dotfiles. Importing the 3monitor config will likely require editing the contents of `modules/hyprland/config/3monitor` to suit your monitor layout.

      *nvidia_bool*: (enabled | disabled) Nvidia Drivers and Hyprland Nvidia patches.

      *Modules*: `./.` is enough for my Hyprland WM environment. 
         *Optional*: `modules/obs`, `modules/toys`, `modules/virt`

   6. `sudo nixos-rebuild switch --flake '.#hostname'` OR `sudo nixos-rebuild switch --flake .` if your `hostname` already matches the hostname specificed in the `flake.nix`.


