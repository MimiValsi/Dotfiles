local g = vim.g
local map = vim.keymap.set

g.mapleader = ' '
--['<C-k>'] 	= { '<cmd>cnext<CR>zz'}, -- quickfix navigation
--['<C-j>'] 	= { '<cmd>cprev<CR>zz'}, -- quickfix navigation
--['<leader>k'] 	= { '<cmd>lnext<CR>zz'}, -- quickfix navigation
--['<leader>j'] 	= { '<cmd>lprev<CR>zz'}, -- quickfix navigation

-- normal mode

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fg', '<cmd>Telescope live_grep')
map('n', '<leader>fb', '<cmd>Telescope buffers')
map('n', '<leader>fh', '<cmd>Telescope help_tags')

-- replace the word everywhere in the file/buffer
map('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- Explorer
map('n', '<leader>e', '<cmd>Ex<CR>')

map('n', '<C-d>', '<C-d>zz<CR>') -- Go down and middle
map('n', '<C-u>', '<C-u>zz<CR>') -- Go up and middle

map('n', 'n', '<cmd>nzzzv') -- search word down and keep middle
map('n', 'N', '<cmd>Nzzzv') -- search word up and keep middle

map('n', '<leader>ww', '<cmd>w<CR>') -- save
map('n', '<leader>wq', '<cmd>wqa<CR>') -- save and quit all files

map('n', ';', ':') -- replace ':' by ';'

map('n', 'Q', '<nop>') -- Deactive 'Q'

-- make the current buffer/file executable
map('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- insert mode
map('i', '<C-h>', '<Left>') -- Allows to go Left while in Insert mode
map('i', '<C-j>', '<Down>') -- Allows to go Down while in Insert mode
map('i', '<C-k>', '<Up>') -- Allows to go Up while in Insert mode
map('i', '<C-l>', '<Right>') -- Allows to go Right while in Insert mode
map('i', '<C-b>', '<ESC>^i') -- Go to first letter of the line
map('i', '<C-e>', '<End>') -- Go to end of the line

-- visual mode
map('v', 'J', "<cmd>m '>+1<CR>gv=gv") -- make the selected hightlighted line and go up one line, indent if possible and highlight it again
map('v', 'K', "<cmd>m '<-2<CR>gv=gv") -- same thing but go down a line

map('v', '<leader>y', '"+y') -- yank to system keyboard
map('v', '<leader>Y', '"+Y') -- yank to system keyboard
map('v', '<leader>d', '"_d') -- delete in void register

-- x mode need to find out
map('x', '<leader>p', '"_dP')
