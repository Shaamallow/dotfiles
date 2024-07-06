return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require("bufferline")
    bufferline.setup({})
    vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>", { desc = "Cycle to next buffer" })
    vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>", { desc = "Cycle to next buffer" })
    vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })
  end,
}
