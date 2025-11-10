return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		keys = {
			{ "<leader>gsd", "<cmd>Gitsigns diffthis main<cr>" },
		},
		opts = {
			current_line_blame = true,
		},
	},
	{
		"tpope/vim-fugitive",
		keys = {
			{ "<leader>if", "<cmd>Git difftool<cr>" },
		},
	},
}
