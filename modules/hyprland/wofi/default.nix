{ pkgs, username, ... }:
{
  environment.systemPackages = with pkgs; [ wofi ];

  home-manager.users.${username} = {
    home.file = {
      ".config/wofi/config".text = ''
        width=420
        height=550
        location=center
        show=drun
        matching=fuzzy
        prompt=Search...
        filter_rate=100
        allow_markup=true
        no_actions=true
        halign=fill
        orientation=vertical
        content_halign=fill
        insensitive=true
        allow_images=true
        image_size=28
        gtk_dark=true
        term=foot
      '';

      ".config/wofi/style.css".text = ''
                * {
                	transition: 0.2s;
                }

                window {
                	font-family: "IBM Plex Mono";
                	font-size: 13px;
                }

                window {
                	margin: 0px;
                	border: 3px solid #0888B9;  
        		background-color: rgba(21, 48,138,0.7);
                	background-image: url('/home/${username}/.config/backgrounds/keyboard.png');
                	background-size: cover;
                	background-repeat: no-repeat; 
                	border-radius: 16px;
                }

                #input {
                	position: relative;
                	padding: 4px;
                	margin: 20px;
                	padding-left: 20px;
                	border: 3px solid #CB7820;
                	color: #fff;
                	font-weight: bold;
                	background-color: transparent; 
                	outline: none;
                	border-radius: 16px;
                	z-index: 1;
                }

                #input image {
                	color: #fff;
                }

                #input:focus {
                	border: none;
                	outline: none;
                }

                #inner-box {
                	margin: 20px;
                	margin-top: 0px;
                	border: none;
                	color: #CB7820; 
                	border-radius: 16px;
                }

                #inner-box * {
                	transition: none;
                }

                #outer-box {
                	margin: 0px;
                	border: none;
                	padding: 0px;
                	border-radius: 16px;
                }

                #scroll {
                	margin-top: 5px;
                	border: none;
                	border-radius: 16px;
                	margin-bottom: 5px;
                }

                #text:selected {
                	color: #fff;
                	font-weight: bold;
                }

                #img {
                	margin-right: 20px;
                	background: transparent;
                }

                #text {
                	color: #fff;
                	margin: 0px;
                	border: none;
                	padding: 0px;
                	background: transparent;
                }

                #entry {
                	margin: 0px;
                	border: none;
                	border-radius: 16px;
                	background-color: transparent;
                	min-height:32px;
                	font-weight: bold;
                }

                #entry:selected {
                	position: relative;
                	outline: none;
                	margin: 0px;
                	border: 3px solid orange;
                	border-radius: 16px;
                	background-color: transparent;
                	z-index: 1;
                }
      '';
    };
  };
}
