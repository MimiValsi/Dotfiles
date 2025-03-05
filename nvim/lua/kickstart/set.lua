local autocmd = vim.api.nvim_create_autocmd

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Enable break indent
vim.opt.breakindent = true

vim.opt.cindent = true

vim.opt.expandtab = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'i'

-- Make line numbers default
vim.opt.number = true

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamed,unnamedplus'
end)
-- vim.opt.clipboard = 'unnamedplus'
-- vim.opt.clipboard = 'unnamed'

vim.opt.guicursor = 'n:blinkon200'

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true

vim.opt.preserveindent = true

vim.opt.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

vim.opt.smartcase = true
vim.opt.smartindent = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false -- disabled

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
vim.opt.termguicolors = true -- use 24-bit RGB color in TUI

vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir' -- changed for a more convenient place

-- Decrease update time
vim.opt.updatetime = 250

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

autocmd('FileType', {
  pattern = { 'html', 'javascript', 'tex', 'sql' },

  callback = function()
    vim.opt.matchpairs = '(:),{:},[:],<:>' -- added '<:>' for html
    -- vim.opt.shiftround = true -- round indent to multiple of 'shiftwidth'
    vim.opt.shiftwidth = 2
  end,
})

autocmd('FileType', {
  pattern = { 'go', 'c' },

  callback = function()
    vim.opt.shiftround = true
    vim.opt.shiftwidth = 8
  end,
})
