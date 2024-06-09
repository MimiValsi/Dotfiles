local g = vim.g
local map = vim.keymap.set

g.mapleader = " "

---- NORMAL MODE ----
map("n", "<leader>y", '"+y', { desc = "yank to internal register" })
map("n", "<leader>p", '"+p', { desc = "past from internal register" })

map("n", "<leader>e", ":Ex<CR>", { desc = "Explorer" })

map("n", "<leader>w", ":w<CR>", { desc = "save" })

map("n", "<leader>q", ":q<CR>", { desc = "exit" })

map("n", ";", ":", { desc = "replace ':' by ';'" })

map(
  "n",
  "<leader>s",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "replace the word everywhere in the file/buffer" }
)

map("n", "<Tab>", "gt", { desc = "navigate tab to the right" })
map("n", "<S-Tab>", "gT", { desc = "navigate tab to the left" })

map("n", "m", "%", { desc = "navigate between () or {} or []" })
map("n", "<leader>v", ":vsplit<CR>")
map("n", "Q", ":noh<CR>", { desc = "deactivate 'Q'" })

map(
  "n",
  "<leader>x",
  ":!chmod +x %<CR>",
  { silent = true, desc = "make the current buffer/file executable" }
)

---- INSERT MODE ----
map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")
map("i", "<C-b>", "<ESC>^i")
map("i", "<C-e>", "<End>")
map("i", "jk", "<Esc>")

---- VISUAL MODE ----
map("v", "J", ":m '>+1<CR>gv=gv", {
  desc = [[make the selected hightlighted line and go up one line, indent if possible and highlight it again]],
})

map("v", "K", ":m '<-2<CR>gv=gv", {
  desc = [[make the selected hightlighted line and go up one line, indent if possible and highlight it again]],
})
