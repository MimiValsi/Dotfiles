return {}
-- local augroup = vim.api.nvim_create_augroup("lsp_format_on_save", {})
--
-- local event = "BufWritePre"
--
-- -- Only use null-ls as formatter
-- local lsp_formatting = function(bufnr)
--   vim.lsp.buf.format({
--     filter = function(client) return client.name == "null-ls" end,
--     bufnr = bufnr,
--   })
-- end
--
-- -- Format on save
-- local on_attach = function(client, bufnr)
--   if client.supports_method("textDocument/formatting") then
--     vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
--
--     vim.api.nvim_create_autocmd(event, {
--       group = augroup,
--       buffer = bufnr,
--       callback = function() lsp_formatting(bufnr) end,
--     })
--
--     vim.keymap.set("n", "<leader>l", function() lsp_formatting(bufnr) end)
--   end
-- end
--
-- return {
--   "nvimtools/none-ls.nvim",
--
--   dependencies = { "nvim-lua/plenary.nvim" },
--   -- lazy = false,
--
--   config = function()
--     local null_ls = require("null-ls")
--     local f = null_ls.builtins.formatting
--     local d = null_ls.builtins.diagnostics
--     --
--     null_ls.setup({
--       sources = {
--         f.stylua,
--         f.black,
--         d.flake8,
--         d.quick_lint_js,
--       },
--
--       on_attach = on_attach,
--     })
--   end,
-- }