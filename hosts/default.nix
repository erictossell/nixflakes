{ hostname, ... }: 
{
	imports = [
		./${hostname}/hardware-configuration.nix
		./${hostname}
		./hardware
	];
}

