return {
	{
		"b0o/incline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
			"folke/tokyonight.nvim",
		},
		config = function()
			local colors = require("tokyonight.colors").setup()
			local helpers = require("incline.helpers")
			local devicons = require("nvim-web-devicons")
			require("incline").setup({
				window = {
					padding = 0,
					margin = { horizontal = 0 },
				},
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					if filename == "" then
						filename = "[No Name]"
					end
					local ft_icon, ft_color = devicons.get_icon_color(filename)
					local modified = vim.bo[props.buf].modified
					local bg_color = colors.bg_statusline
					return {
						{ "", guifg = ft_color or bg_color },
						{
							ft_icon
									and { "", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) }
								or "",
							" ",
							{ filename, gui = modified and "bold,italic" or "bold" },
							" ",
							guibg = bg_color,
						},
						{ "", guifg = bg_color },
					}
				end,
			})
		end,
		event = "VeryLazy",
	},
}
