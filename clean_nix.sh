#!/usr/bin/env bash

sudo nix-env --delete-generations old --profile /nix/var/nix/profiles/system

nix-env --delete-generations old

sudo nix-collect-garbage -d

sudo nix-store --optimise
