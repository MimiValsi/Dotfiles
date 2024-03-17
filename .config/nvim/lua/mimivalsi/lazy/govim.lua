return {
  "fatih/vim-go",

  vim.keymap.set(
    "n",
    "<leader>oo",
    ":GoAddTags<CR>",
    { desc = "need to ne inside function" }
  ),

  vim.keymap.set(
    "n",
    "<leader>op",
    ":GoRemoveTags<CR>",
    { desc = "need to be inside function" }
  ),

  -- dirty way to change vim-go settings
  vim.cmd("let g:go_gopls_gofumpt=1"),
}
