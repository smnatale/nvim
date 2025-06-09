return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"ThePrimeagen/refactoring.nvim",
			"nvim-treesitter/nvim-treesitter",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		keys = {
			{ "<leader>sf", "<cmd>Telescope find_files<cr>" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>" },
		},
		config = function()
			local actions = require("telescope.actions")

			require("telescope").setup({
				pickers = {
					find_files = {
						hidden = true,
					},
					git_files = {
						show_untracked = true,
					},
				},
				defaults = {
					mappings = {
						i = {
							["<C-S-h>"] = actions.move_selection_previous,
							["<C-S-l>"] = actions.move_selection_next,
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
							["<C-x>"] = actions.delete_buffer,
						},
					},
					file_ignore_patterns = {
						"node_modules",
						"yarn.lock",
						".git",
						".sl",
						"_build",
						".next",
						"dist",
						".yarn",
						"logs",
						"*.log",
						"npm-debug.log*",
						".yarn/cache",
						".yarn/install-state.gz",
						"yarn-debug.log*",
						"yarn-error.log*",
						"pnpm-debug.log*",
						"lerna-debug.log*",
						"node_modules",
						"dist",
						"dist-ssr",
						"*.local",
						".git",
						".npmrc",
						".yarnrc",
						"build",
						"dist",
						"node_modules",
						"coverage",
						"storybook-static",
						".storybook",
					},
					hidden = true,
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown({}),
						},
						fzf = {
							fuzzy = true, -- false will only do exact matching
							override_generic_sorter = true, -- override the generic sorter
							override_file_sorter = true, -- override the file sorter
							case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						},
					},
				},
			})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("refactoring")
			require("telescope").load_extension("fzf")
		end,
	},
}
