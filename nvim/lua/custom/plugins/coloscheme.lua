return {
  'blazkowolf/gruber-darker.nvim',
  config = function()
    require('gruber-darker').setup {
      opts = {
        italic = {
          comments = false,
        },
      },
    }
    vim.cmd.colorscheme 'gruber-darker'
  end,
}
-- vim: ts=2 sts=2 sw=2 et
