local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Create custom options
autocmd({'FileType'}, {
  pattern = '*', -- Change every type of file

  callback = function()
    opt.textwidth = 80
    opt.relativenumber = true
    opt.number = true
    opt.clipboard = 'unnamedplus'
    opt.swapfile = false
    opt.backup = false
    opt.scrolloff = 8
    opt.guicursor = 'n-v-c-sm:block'
    opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
    opt.timeoutlen = 200
    opt.cursorline = true
    opt.smartindent = true
    opt.shiftwidth = 4
    opt.ignorecase = true
    opt.smartcase = true
  end,
})

autocmd('FileType', {
  pattern = { 'lua', 'js', 'html' },

  callback = function()
    opt.shiftwidth = 2
  end,
})

autocmd('FileType', {
  pattern = { 'go', 'c' },

  callback = function()
    opt.shiftwidth = 8
  end,
})
