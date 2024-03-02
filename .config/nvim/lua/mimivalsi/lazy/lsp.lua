local function on_attach(opts)
  local map = vim.keymap.set
  map('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  map('n', 'K', function() vim.lsp.buf.hover() end, opts)
  map('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
  map('n', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
  map('n', '<space>wr', function() vim.lsp.buf.remove_workspace_folder() end, opts)
  map('n', '<space>D', function() vim.lsp.buf.type_definition() end, opts)
  map('n', '<space>rn', function() vim.lsp.buf.rename() end, opts)
  map({ 'n', 'v' }, '<space>ca', function() vim.lsp.buf.code_action() end, opts)
  map('n', 'gr', function() vim.lsp.buf.references() end, opts)
end

return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    "L3MON4D3/LuaSnip",
    'saadparwaiz1/cmp_luasnip',
    "j-hui/fidget.nvim",
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require('cmp_nvim_lsp')
    local luasnip = require('luasnip')

    local capabilities = vim.tbl_deep_extend(
      'force',
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())

    require('fidget').setup()
    require("mason").setup({
      ui = {
	icons = {
	  package_installed = "✓",
	  package_pending = "➜",
	  package_uninstalled = "✗"
	}
      }
    })

    require('mason-lspconfig').setup({
      ensure_installed = {
	'lua_ls',
	'gopls'
      },

      handlers  = {
	function(server_name)
	  require('lspconfig')[server_name].setup{
	    on_attach = on_attach,
	    capabilities = capabilities,
	  }
	end,

	['lua_ls'] = function ()
	  local lspconfig = require('lspconfig')
	  lspconfig.lua_ls.setup({
	    settings = {
	      Lua = {
		diagnostics = {
		  globals = { 'vim' }
		}
	      }
	    }
	  })
	end,

	['gopls'] = function ()
	  local lspconfig = require('lspconfig')
	  lspconfig.gopls.setup({})
	end
      }
    })

    cmp.setup({
      snippet = {
	expand = function(args)
	  require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	end,
      },

      mapping = cmp.mapping.preset.insert({
	['<CR>'] = cmp.mapping.confirm({ select = true }),

	['<Tab>'] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	  cmp.select_next_item()
	  elseif luasnip.expand_or_jumpable() then
	    luasnip.expand_or_jump()
	  else
	    fallback()
	  end
	end, { 'i', 's' }),

	['<S-Tab>'] = cmp.mapping(function(fallback)
	  if cmp.visible() then
	  cmp.select_prev_item()
	  elseif luasnip.jumpable(-1) then
	    luasnip.jump(-1)
	  else
	    fallback()
	  end
	end, { 'i', 's' })
      }),

      sources = cmp.config.sources({
	{ name = 'nvim_lsp' },
	  { name = 'luasnip' }, -- For luasnip users.
      }, {
	  { name = 'buffer' },
	})
    })

    vim.diagnostic.config({
      update_in_insert = true,
      float = {
	focusable = false,
	style = 'minimal',
	border = 'rounded',
	source = 'always',
	header = '',
	prefix = ''
      },
      virtual_box = true
    })
  end
}
