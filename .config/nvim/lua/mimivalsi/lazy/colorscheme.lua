return {
  'folke/tokyonight.nvim',
  config = function()
    require('tokyonight').setup({
      style = 'night',
      transparent = true,
      terminal_colors = true,
    })
    vim.cmd('colorscheme tokyonight')
  end
}
