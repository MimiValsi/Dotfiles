return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    local map = vim.keymap.set

    map("n", "<leader>a", function() harpoon:list():add() end)
    map(
      "n",
      "<C-h>",
      function() harpoon.ui:toggle_quick_menu(harpoon:list()) end
    )

    map("n", "<leader>1", function() harpoon:list():select(1) end)
    map("n", "<leader>2", function() harpoon:list():select(2) end)
    map("n", "<leader>3", function() harpoon:list():select(3) end)
    map("n", "<leader>4", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    -- map("n", "<leader>pp", function() harpoon:list():prev() end)
    -- map("n", "<leader>po", function() harpoon:list():next() end)
  end,
}
