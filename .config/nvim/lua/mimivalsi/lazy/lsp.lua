return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre" },

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    "nvimtools/none-ls.nvim",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local luasnip = require("luasnip")
    local fidget = require("fidget")
    local nls = require("null-ls")

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    fidget.setup()

    local handlers = {
      function(server)
	lspconfig[server].setup({
	  capabilities = capabilities,
	})
      end,

      ["lua_ls"] = function()
	lspconfig.lua_ls.setup({
	  settings = {
	    Lua = {
	      diagnostics = {
		globals = {
		  "vim"
		}
	      }
	    }
	  }
	})

      end,

      ["gopls"] = function ()
	lspconfig.gopls.setup({
	  settings = {
	    gopls = {
	      gofumpt = true,
	    }
	  }
	})
      end
    }

    mason.setup({
      ui = {
	icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
	}
      }
    })

    mason_lspconfig.setup({
      ensure_installed = { "lua_ls", "gopls" },
      handlers = handlers,
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        -- { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
      }, {
        { name = "buffer" },
      }),
    })

    vim.diagnostic.config({
      update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      virtual_box = true,
    })
  end
}
