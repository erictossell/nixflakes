{ home-manager, username, ... }:
{
  home-manager.users.${username} =  { ... }: {
    home.file = {
      ".config/swaylock/background.jpg".source = swaylock/background.jpg;

      ".config/swaylock/config".text = ''
# indicator
# no-unlock-indicator
# daemonize
ignore-empty-password

#clock
#timestr=%R
#datestr=%a, %e of %B

indicator-caps-lock
# datestr=%A
image=~/.config/swaylock/background.jpg
scaling=fill
font=monospace term
font-size=25

# Ring
indicator-radius=250
indicator-thickness=75
# line-uses-ring
line-color=#3b4252
text-color=#d8dee9
inside-color=#2e344098
inside-ver-color=#5e81ac
line-ver-color=#5e81ac
ring-ver-color=#5e81ac98
ring-color=#4c566a
key-hl-color=#5e81ac
separator-color=#4c566a
layout-text-color=#eceff4
line-wrong-color=#d08770
      '';

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
	font-family: "M+1Code Nerd Font";
	font-size: 13px;
}

window {
	margin: 0px;
	border: 3px solid #006400; /* Dark green */
	background-color: rgba(21, 48,138,0.7);
	background-image: url('/home/eriim/.config/hypr/backgrounds/keyboard.png'); /* Add this line */
	background-size: cover; /* And this line */
	background-repeat: no-repeat; /* And this line */
	border-radius: 16px;
}

#input {
	position: relative;
	padding: 4px;
	margin: 20px;
	padding-left: 20px;
	border: 3px solid #006400;
	color: #fff;
	font-weight: bold;
	background-color: transparent; /* Remove the background gradient */
	background-image: url('/home/eriim/.config/hypr/backgrounds/scifi_landscape.jpg'); /* Add this line */
	background-size: cover; /* And this line */
	background-repeat: no-repeat; /* And this line */
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
	color: #006400; /* Dark green */
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
	border: 3px solid green;
	border-radius: 16px;
	background-color: transparent; /* Remove the background gradient */
	z-index: 1;
}
      '';
    };
  };
}
