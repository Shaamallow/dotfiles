return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
        },
        ensure_installed = {
          "black",
          "debugpy",
          "isort",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "pyright", "svelte" },
        -- ruff is not installed as builtin not maintained / with available lsp for null-ls have been removed
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.svelte.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })

      --- LSP Formatting on save

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = ev.buf })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover to see info", buffer = ev.buf })
          vim.keymap.set(
            "n",
            "<leader>ca",
            vim.lsp.buf.code_action,
            { desc = "Code action", buffer = ev.buf }
          )
          vim.keymap.set(
            "n",
            "gi",
            vim.lsp.buf.implementation,
            { desc = "Go to implementation", buffer = ev.buf }
          )
          vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format file", buffer = ev.buf })
          vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = ev.buf })
        end,
      })
    end,
  },
}
