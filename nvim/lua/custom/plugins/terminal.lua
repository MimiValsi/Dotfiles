return {
  'akinsho/toggleterm.nvim',
  version = '*',
  -- config = true,
  config = function()
    require('toggleterm').setup {
      direction = 'float',
      open_mapping = [[<c-\>]], -- This sets up the default toggle mapping
      float_opts = {
        border = 'curved', -- Optional: customize the floating window border
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end, -- Optional: 80% width
        height = function()
          return math.floor(vim.o.lines * 0.8)
        end, -- Optional: 80% height
        winblend = 0, -- Optional: transparency level (0 = opaque)
      },
      -- Other options as needed...
      insert_mappings = true, -- Allow toggle in insert mode
      terminal_mappings = true, -- Allow toggle in terminal mode
      close_on_exit = true,
      shade_terminals = true,
    }

    -- Override the default mapping to also set the git directory
    -- This ensures the terminal opens (or toggles) in the root of the current git repo by searching for .git
    vim.keymap.set('n', '<C-k>', '<Cmd>ToggleTerm dir=git_dir<CR>', { silent = true, noremap = true })
    -- vim.keymap.set('i', '<C-k>', '<Esc><Cmd>ToggleTerm dir=git_dir<CR>', { silent = true, noremap = true })
    vim.keymap.set('t', '<C-k>', '<Cmd>ToggleTerm dir=git_dir<CR>', { silent = true, noremap = true })

    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    end
    vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
  end,
}
-- vim: ts=2 sts=2 sw=2 et
