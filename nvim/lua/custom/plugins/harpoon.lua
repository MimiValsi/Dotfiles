return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end, { silent = true, desc = 'Harpoon add to list' })

    vim.keymap.set('n', '<C-a>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { silent = true, desc = 'Harpoon quick menu' })

    vim.keymap.set('n', '<leader>1', function()
      harpoon:list():select(1)
    end, { silent = true, desc = 'Harpoon select 1' })
    vim.keymap.set('n', '<leader>2', function()
      harpoon:list():select(2)
    end, { silent = true, desc = 'Harpoon select 2' })
    vim.keymap.set('n', '<leader>3', function()
      harpoon:list():select(3)
    end, { silent = true, desc = 'Harpoon select 3' })
    vim.keymap.set('n', '<leader>4', function()
      harpoon:list():select(4)
    end, { silent = true, desc = 'Harpoon select 4' })
    vim.keymap.set('n', '<leader>j', function()
      harpoon:list():prev()
    end, { silent = true, desc = 'Harpoon list prev' })
    vim.keymap.set('n', '<leader>k', function()
      harpoon:list():next()
    end, { silent = true, desc = 'Harpoon list next' })
  end,
}
-- local harpoon = require 'custom.plugins.harpoon'
-- harpoon:setup()
--
-- vim.keymap.set('n', '<leader>a', function()
--   harpoon:list():add()
-- end)
-- vim.keymap.set('n', '<C-a>', function()
--   harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)
--
-- vim.keymap.set('n', '<leader>1', function()
--   harpoon:list():select(1)
-- end)
-- vim.keymap.set('n', '<leader>2', function()
--   harpoon:list():select(2)
-- end)
-- vim.keymap.set('n', '<leader>3', function()
--   harpoon:list():select(3)
-- end)
-- vim.keymap.set('n', '<leader>4', function()
--   harpoon:list():select(4)
-- end)
-- vim.keymap.set('n', '<leader>j', function()
--   harpoon:list():prev()
-- end)
-- vim.keymap.set('n', '<leader>k', function()
--   harpoon:list():next()
-- end)
