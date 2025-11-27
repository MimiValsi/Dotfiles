vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false

-- [[ Setting options ]]

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.mousehide = true
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shiftwidth = 2
vim.o.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.o.inccommand = 'split'
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.confirm = true
-- vim.o.guicursor = 'a:block-blinkwait175-blinkoff150-blinkon175'
vim.o.guicursor = 'a:block,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

-- [[ Basic Keymaps ]]
function Map(mode, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- NORMAL
vim.keymap.set('n', ';', ':')

Map('n', '<Esc>', '<cmd>nohlsearch<CR>')
Map('n', '<leader>e', '<cmd>Oil<cr>')
Map('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
Map('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
Map('n', '<C-\\>', '<cmd>ToggleTerm dir=git_dir direction=float<cr>', { desc = 'Open a floating terminal' })
Map('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
Map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
Map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
Map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
Map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- INSERT
Map('i', '<C-g>', '<cmd>noh<cr>')
Map('i', '<C-h>', '<left>')
Map('i', '<C-j>', '<down>')
Map('i', '<C-k>', '<up>')
Map('i', '<C-f>', '<right>')
Map('i', '<C-e>', '<end>')
Map('i', '<C-a>', '<esc>^i')
Map('i', '<C-g>', '<esc>')
Map('i', '<C-l>', '<C-o>w', { desc = 'Jump to beginning of new word' })
Map('i', '<C-;>', '<C-o><S-w>', { desc = 'jump to next word after space' })
Map('i', '<C-b>', '<C-o>b', { desc = 'Jump to beginning of prev word' })
Map('i', '<C-d>', '<C-o><S-b>', { desc = 'jump to prev word after space' })

Map('v', 'J', ":m '>+1<CR>gv=gv", {
  desc = 'make the selected hightlighted line and go up one line, indent if possible and highlight it again',
})

Map('v', 'K', ":m '<-2<CR>gv=gv", {
  desc = 'make the selected hightlighted line and go up one line, indent if possible and highlight it again',
})

-- TERM
Map('t', '<C-g><C-g>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  { import = 'custom.plugins' },
  { import = 'kickstart.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
