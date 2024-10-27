return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("neo-tree").setup({
				sources = {
					"filesystem",
					"buffers",
					"document_symbols",
				},
			})
			vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left toggle<CR>", {})
			vim.keymap.set("n", "<leader>fe", ":Neotree document_symbols reveal left toggle<CR>", {})
			vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
		end,
	},
	{
		{
			"stevearc/oil.nvim",
			opts = {},
		},
	},
}
