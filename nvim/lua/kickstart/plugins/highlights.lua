return {
  'brenoprata10/nvim-highlight-colors',

  config = function()
    require('nvim-highlight-colors').setup {
      exclude_filetypes = { 'text' },
      exclude_buftypes = { 'text' },
    }
  end,
}
