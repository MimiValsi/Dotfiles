return {
  'folke/which-key.nvim',

  -- Set global misc keymap
  config = function()
    wk = require('which-key')
    wk.register({
      [';'] = { ':', 'Replace ":" to ";"' },
      ['<leader>w'] = { '<cmd>w<cr>', 'Save File' },
      ['<leader>e'] = { '<cmd>Ex<cr>', 'Explorer' },
      ['q'] = { '<cmd>Noh<cr>', 'Disable recording' },
      ['n'] = { 'nzz', 'Go to next word + cursor @ middle' },
      ['N'] = { 'Nzz', 'Go to prev word + cursor @ middle' },
      ['<leader>s'] = { ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', 'Replace word in all file' },

      ['<leader>q'] = { name = '+q' },
      ['<leader>qq'] = { '<cmd>q<cr>', 'Quit' },

      -- Telescope
      ['<leader>f'] = { name = '+Telescope' },
      ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
      ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
      ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help Tags" },
    })
  end
}
