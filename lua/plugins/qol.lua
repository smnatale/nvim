return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "powerline",
				throttle = 0,
				enable_on_insert = true,
				enable_on_select = true,
				options = {
					multilines = {
						enabled = true,
					},
				},
			})
			vim.diagnostic.config({ virtual_text = false })
		end,
	},
}
