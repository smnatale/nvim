return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		keys = {
			{ "<leader>e", "<cmd>Oil<cr>" },
		},
		dependencies = {
			"refractalize/oil-git-status.nvim",
			"mini.icons",
		},
		opts = {
			win_options = {
				signcolumn = "yes:2",
			},
			view_options = {
				show_hidden = true,
			},
		},
		config = function(_, opts)
			require("mini.icons").setup()
			require("mini.icons").mock_nvim_web_devicons()

			require("oil").setup(opts)
			require("oil-git-status").setup({
				show_ignored = false,
			})
		end,
	},
	{
		-- For when screensharing with co-workers
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"mini.icons",
		},
		lazy = true,
		keys = {
			{ "<leader>tr", "<cmd>NvimTreeToggle<cr>" },
		},
		opts = {
			update_focused_file = {
				enable = true,
			},
			renderer = {
				icons = {
					git_placement = "signcolumn",
					glyphs = {
						git = {
							unstaged = "U",
							staged = "S",
							unmerged = "UM",
							renamed = "R",
							deleted = "D",
							untracked = "UT",
							ignored = "I",
						},
					},
				},
			},
		},
		config = function(_, opts)
			require("mini.icons").setup()
			require("mini.icons").mock_nvim_web_devicons()

			require("nvim-tree").setup(opts)
		end,
	},
}
