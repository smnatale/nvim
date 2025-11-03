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
			{ "<leader>dif", "<cmd>Git difftool<cr>" },
		},
	},
}
