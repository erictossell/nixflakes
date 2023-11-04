return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {

"       ___           ___                                   ___      ",
  "      /  /\\         /  /\\        ___         ___          /__/\\     ",
  "     /  /:/_       /  /::\\      /  /\\       /  /\\        |  |::\\    ",
  "    /  /:/ /\\     /  /:/\\:\\    /  /:/      /  /:/        |  |:|:\\   ",
  "   /  /:/ /::\\   /  /:/~/:/   /__/::\\     /__/::\\      __|__|:|\\:\\  ",
  "  /__/:/ /:/ /\\ /__/:/ /:/___ \\__/\\:\\/__  \\__/\\:\\/__  /__/::::| \\:\\ ",
  "  \\  \\:\\/:/ /:/ \\  \\:\\/:::::/    \\  \\:\\/\\    \\  \\:\\/\\ \\  \\:\\~~\\__\\/ ",
  "   \\  \\::/ /:/   \\  \\::/~~~~      \\__\\::/     \\__\\::/  \\  \\:\\       ",
  "    \\  \\:\\/:/     \\  \\:\\          /__/:/      /__/:/    \\  \\:\\      ",
  "     \\  \\::/       \\  \\:\\         \\__\\/       \\__\\/      \\  \\:\\     ",
  "      \\__\\/         \\__\\/                                 \\__\\/     "
        }
        dashboard.section.buttons.val = {
            dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
            dashboard.button( "f", "󰺄  > Find file", ":cd $HOME/repos | Telescope find_files<CR>"),
            dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
            dashboard.button( "k", "󱔗  > Docs" , ":cd $HOME/Docs | Telescope find_files<CR>"),
            dashboard.button( "n", "  > Nixflakes" , ":cd $HOME/repos/nixflakes | Telescope find_files<CR>"),
            dashboard.button( "q", "󰗼  > Quit NVIM", ":qa<CR>"),
        }
        alpha.setup(dashboard.opts)
        vim.cmd([[
           autocmd FileType alpha setlocal nofoldenable
        ]])
    end
}
