return {
  'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup({
          theme = 'doom',
          config = {
            week_header = {
              enable = true,
            }, --your header
            center = {
              {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find File',
                desc_hl = 'String',
                key = 'f',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = 'Telescope find_files theme=dropdown'
              },
              {
                icon = ' ',
                desc = 'Find Dotfiles',
                key = 'b',
                keymap = 'SPC f d',
                action = 'Telescope'
              },
              {
                icon = ' ',
                desc = 'Find Recent Files',
                key = 'r',
                keymap = 'SPC f d',
                action = 'Telescope oldfiles'
              },
              {
                icon = ' ',
                desc = 'Open nixflakes',
                key = 'n',
                action = 'cd ~/repos/nixflakes | :Neotree'
              },
              {
                icon = ' ',
                desc = 'Open KnowledgeVault',
                key = 'k',
                action = 'cd ~/Documents/KnowledgeVault | :Neotree'
              },
              {
                icon = ' ',
                desc = 'Open home',
                key = 'h',
                action = 'cd ~ | :Neotree'
              },
            },
          footer = {}  --your footer
          }
        })
      end,
      dependencies = {{'nvim-tree/nvim-web-devicons'}}
}
