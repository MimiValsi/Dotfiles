return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        html = { "prettier" },
        javascript = { "prettier" },
	sql = { "sql-formatter" },
	latex = { "bibtex-tidy" },
      },

      vim.keymap.set(
        { "n", "v" },
        "<leader>ll",
        function()
          conform.format({
            lsp_fallback = true,
            asycn = false,
            timeout_ms = 500,
          })
        end
      ),
    })
  end,
}
