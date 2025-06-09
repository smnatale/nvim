return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-jest",
			"thenbe/neotest-playwright",
		},
		keys = {
			{ "<leader>tr", "<cmd>Neotest run<cr>" },
			{ "<leader>ti", "<cmd>Neotest output<cr>" },
			{ "<leader>ts", "<cmd>Neotest summary<cr>" },
			{ "<leader>ta", "<cmd>lua require('neotest').run.run({ suite = true })<cr>" },
		},
		config = function()
			require("neotest").setup({
				settings = {
					watch = true,
				},
				adapters = {
					require("neotest-vitest"),
					require("neotest-jest"),
					require("neotest-playwright").adapter({
						options = {
							persist_project_selection = true,
							enable_dynamic_test_discovery = true,
						},
					}),
				},
			})
		end,
	},
}
