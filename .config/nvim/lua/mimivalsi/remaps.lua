local g = vim.g
local key_sey = vim.keymap.set

g.mapleader = ' '

-- normal mode
--key_sey('n', ';', ':') -- Replace ':' into ';'
--key_sey('n', '<leader>w', vim.cmd.w) -- Save file
--key_sey('n', '<leader>e', vim.cmd.Ex) -- Go to explorer view
--key_sey('n', '<leader>qq', vim.cmd.q) -- Exit vim
--key_sey('n', 'q', vim.cmd.noh) -- Take off search
--key_sey('n', 'n', 'nzz') -- Go to next word + cursor @ middle
--key_sey('n', 'N', 'nzz') -- Go to prev word + cursor @ middle
--key_sey('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>') -- Replace every word in the file

-- insert mode
key_sey('i', '<C-h>', '<Left>') -- Allows to go Left while in Insert mode
key_sey('i', '<C-j>', '<Down>') -- Allows to go Down while in Insert mode
key_sey('i', '<C-k>', '<Up>') -- Allows to go Up while in Insert mode
key_sey('i', '<C-l>', '<Right>') -- Allows to go Right while in Insert mode
key_sey('i', '<C-b>', '<ESC>^i') -- Go to first letter of the line
key_sey('i', '<C-e>', '<End>') -- Go to end of the line
