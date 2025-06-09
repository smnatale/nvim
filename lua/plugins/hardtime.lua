return {
	{
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = {
			{
				"rcarriga/nvim-notify",
				config = function()
					vim.notify = require("notify")
				end,
			},
			"MunifTanjim/nui.nvim",
		},
		opts = {
			hint = true,
			restricted_keys = {
				["<Right>"] = { "n", "x" },
				["<Left>"] = { "n", "x" },
				["<Down>"] = { "n", "x" },
				["<Up>"] = { "n", "x" },
			},
			disabled_keys = {
				["<Up>"] = {},
				["<Down>"] = {},
				["<Left>"] = {},
				["<Right>"] = {},
			},
		},
	},
}
