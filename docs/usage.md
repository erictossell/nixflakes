# How to use this repo
## Requirements: NixOS, x86_64

These steps assume that you have already installed NixOS.

For documentation on how to complete a minimal NixOS install: [Minimal Install](minimal-install.md)

There are no inherit advantages to using the minimal installation as opposed to the GUI. If you want to enable LUKS without manually encrypting your drive, use the GUI.

   ### 1. Clone the repo and change directory.

   ```bash
   git clone --depth 1 https://github.com/erictossell/nixflakes.git && cd nixflakes
   ```
   
   #### a) If you have not installed anything beyond the minimal image, you will need to `nix-shell -p git` to temporarily install git.

   ### 2. Run the build script. 

   ```bash
   sh/build.sh
   ```
      
   a. Enter a new hostname
   
   b. Enter a new username
      
   c. Y/n for Nvidia usage.
     
   d. If you have an existing `hardware-configuration.nix` stored in `/etc/nixos` the script will as if you would like to import it. If you have not generated one yet it will do so for you and then import it.
 
   ### 3. Validate the flake imports went okay.

   ```bash
   git add .
   nix flake check
   ```

   **If you havent enabled experimental features**

   ```bash
   git add .
   nix flake check --extra-experimental-features nix-command --extra-experimental-features flakes
   ```
   
   ### 4. Build the system. 

   ```bash
   sudo nixos-rebuild switch --flake '.#hostname'
   ```
   **OR if your `hostname` already matches the hostname specificed in the `flake.nix`.**
   ```bash
   sudo nixos-rebuild switch --flake .
   ```

   ### 5. Let me know if you run into any issues. :)
  
