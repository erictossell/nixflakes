{ config, pkgs, ... }:
{
  imports = [
	./bluetooth
	./sound
  ];
}
