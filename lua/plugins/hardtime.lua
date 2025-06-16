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
			disabled_keys = {
				["<Up>"] = {},
				["<Down>"] = {},
				["<Left>"] = {},
				["<Right>"] = {},
			},
		},
	},
}
