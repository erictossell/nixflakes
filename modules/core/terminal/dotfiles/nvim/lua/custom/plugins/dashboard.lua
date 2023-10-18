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
                desc = 'Find File           ',
                desc_hl = 'String',
                key = 'b',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = 'Telescope find_files'
              },
              {
                icon = ' ',
                desc = 'Find Dotfiles',
                key = 'f',
                keymap = 'SPC f d',
                action = 'Telescope'
              },
            },
          footer = {}  --your footer
          }
        })
      end,
      dependencies = {{'nvim-tree/nvim-web-devicons'}}
}
