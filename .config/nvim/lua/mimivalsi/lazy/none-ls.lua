local null_ls = require("null-ls")
local group =
    vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true })
local event = { "BufReadPre", "BufNewFile" }
local format = null_ls.builtins.formatting
local diag = null_ls.builtins.diagnostics

local on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.keymap.set(
            "n",
            "<Leader>l",
            function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end,
            { buffer = bufnr, desc = "[lsp] format" }
        )

        -- format on save
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        vim.api.nvim_create_autocmd(event, {
            buffer = bufnr,
            group = group,
            callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end,
            desc = "[lsp] format on save",
        })
    end

    if client.supports_method("textDocument/rangeFormatting") then
        vim.keymap.set(
            "x",
            "<Leader>l",
            function()
                vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end,
            { buffer = bufnr, desc = "[lsp] format" }
        )
    end
end

local sources = {
    -- lua
    format.stylua.with({
        condition = function(utils)
            return utils.root_has_file({ ".stylua.toml" })
        end,
        -- extra_args = { "--config-path ./stylua.toml" },
        -- extra_args = { "-s" }
    }),

    -- c

    -- go
    format.goimports_reviser,

    format.prettier.with({
        filetypes = { "javascript", "html", "yaml", "json" },
	extra_files = { "toml" },
        condition = function(utils)
            -- return utils.root_has_file({ ".prettierrc.yaml" })
            return utils.root_has_file({ ".prettierrc.json" })
        end,
    }),

    -- yaml
    -- diag.yamllint,
    --format.yamlfix,
}

return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        null_ls.setup({
            sources = sources,
            on_attach = on_attach,
        })
    end,
}
