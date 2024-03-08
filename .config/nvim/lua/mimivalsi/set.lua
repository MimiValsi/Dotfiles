local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Create custom options
autocmd({ "FileType" }, {
  pattern = "*", -- Change every type of file

  callback = function()
    opt.mouse = "i" -- allows mouse in Insert mode only
    opt.relativenumber = true
    opt.modifiable = true
    opt.number = true
    --opt.clipboard = 'unnamedplus'
    opt.syntax = "on"
    opt.encoding = "utf-8"
    opt.fileencoding = "utf-8"
    opt.swapfile = false
    opt.backup = false
    opt.scrolloff = 8
    opt.guicursor = "n-v-c-sm:block"
    opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
    opt.cursorline = true
    opt.smartindent = true
    opt.shiftwidth = 4
    opt.ignorecase = true
    opt.smartcase = true
    opt.splitright = true
  end,
})

-- autocmd("FileType", {
--   pattern = { "lua", "js", "html" },
--
--   callback = function()
--     opt.shiftwidth = 2
--   end,
-- })
--
-- autocmd("FileType", {
--   pattern = { "go", "c" },
--
--   callback = function()
--     opt.shiftwidth = 8
--   end,
-- })
