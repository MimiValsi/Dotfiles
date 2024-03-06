return {

	"jose-elias-alvarez/null-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },

	config = function ()

		local present, null_ls = pcall(require, "null_ls")

		if not present then
			return
		end

		local b = null_ls.builtins

		local sources = {
			-- lua
			b.formatting.stylua,

			-- go
			--b.formatting.goimports_reviser,
			--b.diagnostics.golangci_lint,
		}

		null_ls.setup{
			--debug = true,
			source = sources
		}
	end
}
