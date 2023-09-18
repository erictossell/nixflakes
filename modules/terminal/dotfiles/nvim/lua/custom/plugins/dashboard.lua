return {
  'glepnir/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        require('dashboard').setup {
          theme = 'hyper',
          disable_move = false,
          config = {
            week_header = {
              enable = true,
              concat = 'Dev, Writing, Notetakeing',
            }
          }
        }
      end,
      dependencies = {{'nvim-tree/nvim-web-devicons'}}
}
