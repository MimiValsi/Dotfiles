return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',

  dependencies = { 'nvim-lua/plenary.nvim' },

  config = function ()
    local builtin = require('telescope.builtin')
    local map = vim.keymap.set

    map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
    map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
    map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
    map('n', '<leader>fs', function ()
    	builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
  end

}
