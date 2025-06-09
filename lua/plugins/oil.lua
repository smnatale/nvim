return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			win_options = {
				signcolumn = "yes:2",
			},
		},
		keys = {
			{ "<leader>e", "<cmd>Oil<cr>" },
		},
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
	},
	{
		"refractalize/oil-git-status.nvim",
		dependencies = { "stevearc/oil.nvim" },
		config = function()
			require("oil-git-status").setup({
				show_ignored = false,
			})
		end,
	},
}
