local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

autocmd('FileType', {
  pattern = { 'Makefile' },

  callback = function()
    opt.expandtab = false -- use space instead of tab
    opt.shiftround = true -- round indent to multiple of 'shiftwidth'
    opt.shiftwidth = 8
  end,
})

autocmd('FileType', {
  pattern = { 'go', 'c', 'cpp' },

  callback = function()
    opt.shiftround = true -- round indent to multiple of 'shiftwidth'
    opt.shiftwidth = 8
  end,
})

autocmd('FileType', {
  pattern = { 'html', 'javascript', 'lua', 'tex', 'text' },

  callback = function()
    opt.matchpairs = '(:),{:},[:],<:>' -- added '<:>' for html
    opt.shiftround = true -- round indent to multiple of 'shiftwidth'
    opt.shiftwidth = 2
  end,
})
