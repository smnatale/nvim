return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader>sf", "<cmd>Telescope find_files<cr>" },
		{ "<leader>sg", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>sh", "<cmd>Telescope help_tags<cr>" },
		{ "<leader>sd", "<cmd>Telescope diagnostics<cr>" },
		{ "<leader>sb", "<cmd>Telescope buffers<cr>" },
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
			hidden = true,
		}

		require("telescope").setup({
			defaults = bottom_pane_config,
			extensions = {
				fzf = {},
				["ui-select"] = {},
			},
		})
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
}
