{ pkgs, home-manager, username, ... }:
{
  
  home-manager.users.${username} = { pkgs, ... }: {

     home.file = {
       ".config/nvim".source = ./dots;
     };
     programs.neovim = {
		enable = true;
		defaultEditor = true;
		withPython3 = true;
		plugins = with pkgs.vimPlugins; [
			nvim-tree-lua
			nvim-treesitter-parsers.bash
			nvim-treesitter-parsers.dockerfile
			nvim-treesitter-parsers.go 
			nvim-treesitter-parsers.gomod 
			nvim-treesitter-parsers.gosum
			nvim-treesitter-parsers.html
			nvim-treesitter-parsers.javascript
			nvim-treesitter-parsers.json
			nvim-treesitter-parsers.nix
			nvim-treesitter-parsers.python
			nvim-treesitter-parsers.regex
			nvim-treesitter-parsers.sql		
		];
	};
  };


}
