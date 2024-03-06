return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local null_ls = require("null-ls")

    --local b = null_ls.builtins

    local sources = {
      -- lua
      null_ls.builtins.formatting.stylua,

      -- go
      --null_ls.builtins.code_actions.gomodifytags,
      null_ls.builtins.formatting.gofumpt,
    }

    null_ls.setup({
      sources = sources,
    })
  end,
}
