return {
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				colors = {
					bg = "#090B10",
				},
			})

			vim.cmd("colorscheme vague")
		end,
	},
}
