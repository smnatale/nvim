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
			local bottom_pane_config = {
				layout_strategy = "bottom_pane",
				layout_config = {
					height = 0.4,
					prompt_position = "bottom",
				},
				border = true,
				sorting_strategy = "descending",
			}

			local file_picker_config = {
				layout_config = {
					preview_width = 0.6,
				},
			}

			require("telescope").setup({
				defaults = bottom_pane_config,
				pickers = {
					find_files = vim.tbl_extend("force", file_picker_config, { hidden = true }),
					git_files = vim.tbl_extend("force", file_picker_config, { show_untracked = true }),
				},
				extensions = {
					["ui-select"] = bottom_pane_config,
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
