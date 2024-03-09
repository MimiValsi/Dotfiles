return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        local neogen = require("neogen").setup({
            type = "func",
        })

        local map = vim.keymap.set
        map(
            "n",
            "<leader>nf",
            function() neogen.generate({ type = "func" }) end
        )

        map(
            "n",
            "<leader>nt",
            function() neogen.generate({ type = "type" }) end
        )
    end,
}
