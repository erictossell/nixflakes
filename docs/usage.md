# How to use this repo
## Requirements: NixOS, x86_64

These steps assume that you have already installed NixOS.

For documentation on how to complete a minimal NixOS install: [Minimal Install](minimal-install.md)

There are no inherent advantages to using the minimal installation as opposed to the GUI. If you want to enable LUKS without manually encrypting your drive, use the GUI.

   ### 1. Fetch the flake template

   ```bash
   nix flake new -t 'github:erictossell/nixflakes' ./nixflakes && cd nixflakes
   ```

   ### 2. Run the build script. 

   ```bash
   sh/build.sh
   ```
      
   a. Enter a new hostname
   
   b. Enter a new username
      
   c. Y/n for Nvidia usage.
     
   d. If you have an existing `hardware-configuration.nix` stored in `/etc/nixos` the script will ask if you would like to import it. If you have not generated one yet it will do so for you and then import it.
   
   ### 3. Initialize the git repo and add the changes
   ```bash
   git init
   git add .
   ```

   ### 4. Validate the flake imports went okay.

   ```bash
   nix flake check
   ```

   **If you havent enabled experimental features**

   ```bash
   nix flake check --extra-experimental-features nix-command --extra-experimental-features flakes
   ```
   
   ### 5. Build the system. 

   ```bash
   sudo nixos-rebuild switch --flake '.#hostname'
   ```
   **OR if your `hostname` already matches the hostname specificed in the `flake.nix`.**
   ```bash
   sudo nixos-rebuild switch --flake .
   ```
