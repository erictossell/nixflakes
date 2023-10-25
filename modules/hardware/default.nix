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
	./sound
  ] ++ (nvidia.${nvidia_bool} or [ ]); 
}
