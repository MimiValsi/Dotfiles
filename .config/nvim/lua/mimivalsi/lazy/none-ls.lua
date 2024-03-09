local null_ls = require("null-ls")
local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre"
local f = null_ls.builtins.formatting

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.keymap.set("n", "<Leader>l", function()
			vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
		end, { buffer = bufnr, desc = "[lsp] format" })

		-- format on save
		vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
		vim.api.nvim_create_autocmd(event, {
			buffer = bufnr,
			group = group,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
			desc = "[lsp] format on save",
		})
	end

	-- stylua: ignore start
	if client.supports_method("textDocument/rangeFormatting") then
		vim.keymap.set("x", "<Leader>l", function()
			vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
		end, { buffer = bufnr, desc = "[lsp] format" })
	end
	-- stylua: ignore end
end

local sources = {
	-- lua
	f.stylua,

	-- c

	-- go
	f.goimports_reviser,

	f.prettier.with({
		filetypes = { "javascript" },
	}),
}

return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		null_ls.setup({
			on_attach = on_attach,
			sources = sources,
		})
	end,
}
