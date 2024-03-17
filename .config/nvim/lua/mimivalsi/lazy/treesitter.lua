return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        -- Vim
        "vim",
        "vimdoc",

        -- Lua
        "lua",
        "luadoc",

        -- Shell
        "bash",

        -- Backend
        "zig",
        "go",
        "json",

        -- Org
        "org",

        -- Web
        "css",
        "html",
        "javascript",
      },

      sync_install = true,

      auto_install = true,

      indent = {
        enable = true,
      },

      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100KB
          local ok, stats =
            pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

          if ok and stats and stats.size > max_filesize then return true end
        end,

        additional_vim_regex_highlight = { "markdown" },
      },
    })
  end,
}
