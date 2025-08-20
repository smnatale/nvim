return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		keys = {
			{ "<leader>sf", "<cmd>Telescope find_files<cr>" },
			{ "<leader>sg", "<cmd>Telescope live_grep<cr>" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "bottom_pane",
					layout_config = {
						height = 0.4,
						preview_width = 0.7,
						prompt_position = "bottom",
					},
					border = true,
					sorting_strategy = "descending",
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					git_files = {
						show_untracked = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			require("telescope").load_extension("ui-select")
		end,
	},
}
