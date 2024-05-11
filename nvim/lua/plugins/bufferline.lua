return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({})
    vim.keymap.set('n', 'H', '<cmd>BufferLineCyclePrev<CR>')
    vim.keymap.set('n', 'L', '<cmd>BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>')
  end
}
