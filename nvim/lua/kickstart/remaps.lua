local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('n', '<leader>ch', '<cmd>ClangdSwitchSourceHeader<cr>', { desc = 'Switch Source/Header (C/C++)' })

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

map('n', '<leader>e', ':Ex<cr>', { desc = 'Open explorer' })

--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', ';', ':', { desc = 'Cmd shortcut' })

map('n', '<C-i>', ':tabn<cr>', { desc = 'Go to next tab' })
map('n', '<C-o>', ':tabp<cr>', { desc = 'Go to prev tab' })
map('n', '<leader>t', ':tab new<cr>', { desc = 'New tab' })
map('n', '<leader>T', ':tab ter<cr>', { desc = 'New tab with terminal' })

map('n', '<leader>ra', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', { desc = 'replace the word everywhere in the file/buffer' })

map('n', '<leader>w', ':w<cr>', { desc = 'save' })
map('n', 'Q', ':noh<cr>', { desc = 'Disable Q and cleans mini buffer from messages' })

map('n', '<leader>V', ':vert terminal<cr>', { desc = 'Open vertical in vertical split' })

map('n', '<leader>v', ':vsplit<cr>', { desc = 'Vertical split' })

map('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
map('n', '<leader>p', '"*p', { desc = 'Paste from system clipboard' })

map('n', '<leader>d', '"_d', { desc = 'Delete to void register' })

map('n', '<leader>db', ':1, .-bdelete<cr>', { desc = 'Delete all buffers except tabbed' })

map('i', '<C-h>', '<left>', { desc = 'Move focus to the left window' })
map('i', '<C-l>', '<right>', { desc = 'Move focus to the right window' })
map('i', '<C-j>', '<down>', { desc = 'Move focus to the lower window' })
map('i', '<C-k>', '<up>', { desc = 'Move focus to the upper window' })

map('i', 'jk', '<esc>', { desc = 'Exit Insert mode' })

map('i', '<C-b>', '<ESC>^i', { desc = 'Go to begining of line' })
map('i', '<C-e>', '<End>', { desc = 'Go to end of line' })

map('v', 'J', ":m '>+1<CR>gv=gv", {
  desc = [[make the selected hightlighted line and go up one line, indent if possible and highlight it again]],
})

map('v', 'K', ":m '<-2<CR>gv=gv", {
  desc = [[make the selected hightlighted line and go up one line, indent if possible and highlight it again]],
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

map('t', '<C-j><C-k>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
