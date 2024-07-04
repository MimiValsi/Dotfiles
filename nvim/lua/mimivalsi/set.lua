local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Create custom options
autocmd({ "FileType" }, {
  pattern = "*", -- Change every type of file

  callback = function()
    opt.backup = false -- plugin is used instead
    opt.breakindent = true -- wrap indent to match line start
    opt.clipboard = "unnamedplus" -- same "*" & "+" clipboard
    opt.confirm = true -- raise dialogue asking if you wish to save the current file
    opt.completeopt = { "menu", "menuone", "noselect" } -- use popup list when possible
    opt.copyindent = true -- copy previous indent from autoindent
    opt.cursorline = true -- highlight line of the cursor
    opt.expandtab = true -- use tab instead of space
    opt.foldclose = "all" -- close all open folded functions
    opt.foldcolumn = "1" -- column length for folded functions
    opt.guicursor = "n-v-c-sm:block" -- use block cursor in any style
    opt.ignorecase = true -- case insensitive search
    opt.infercase = true -- infer cases in keyword completion
    opt.linebreak = true -- wrap lines at 'breakat'
    opt.list = true -- show trailing spaces
    opt.mouse = "i" -- allows mouse in Insert mode only
    opt.number = true -- activate column numbers
    opt.preserveindent = true -- preserve indents as much as possible
    -- opt.pumheight = 5 -- height of popup menu, good for laptaps
    opt.relativenumber = true -- make column numbers relative, better line jump
    opt.scrolloff = 8 -- minimal screen lines
    -- opt.shiftwidth = 8 -- number of spaces to indent
    opt.showfulltag = true -- show all tags with completion
    opt.signcolumn = "no" -- always show the sign column
    opt.smartindent = true -- make or keep indent before and after specific chars
    opt.splitright = true -- open new window on the right side
    opt.swapfile = false -- disabled
    opt.termguicolors = true -- use 24-bit RGB color in TUI
    opt.timeoutlen = 500 -- timeout between key strokes
    opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- changed for a more convenient place
    opt.updatetime = 300 -- length of time before triggering plugin
    opt.wrap = true -- wrap lines longer than window
    opt.writebackup = false -- plugin used instead
  end,
})

autocmd("FileType", {
  pattern = { "make", "GNUMakefile", "Makefile", "makefile" },

  callback = function()
    opt.expandtab = false -- use space instead of tab
    opt.shiftround = true -- round indent to multiple of 'shiftwidth'
    opt.shiftwidth = 8
  end,
})

autocmd("FileType", {
  pattern = { "go", "c", "cpp" },

  callback = function()
    opt.shiftround = true -- round indent to multiple of 'shiftwidth'
    opt.shiftwidth = 8
  end,
})

autocmd("FileType", {
  pattern = { "html", "javascript", "lua", "tex" },

  callback = function()
    opt.matchpairs = "(:),{:},[:],<:>" -- added '<:>' for html
    opt.shiftround = true -- round indent to multiple of 'shiftwidth'
    opt.shiftwidth = 2
  end,
})
