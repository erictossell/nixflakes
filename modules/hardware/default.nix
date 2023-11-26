{ nvidia_bool, ... }:
let
 nvidia = {
    "enabled" = [ (import ./nvidia) ];
    "disabled" = [ ];
  }; 
in 
{
  imports = [
	#./bluetooth
	./network
	./sound
  ] ++ (nvidia.${nvidia_bool} or [ ]); 
}
