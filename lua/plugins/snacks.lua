local get_custom_layout = function(height)
	return {
		reverse = true,
		layout = {
			box = "vertical",
			backdrop = false,
			row = -1,
			width = 0,
			height = height or 0.4,
			border = "none",
			{
				box = "horizontal",
				{ win = "list", title = "{title}", title_pos = "center", border = "rounded" },
				{ win = "preview", title = "{preview}", width = 0.6, border = "rounded" },
			},
			{ win = "input", height = 1, border = "none" },
		},
	}
end

return {
	{
		"folke/snacks.nvim",
		lazy = false,
		---@type snacks.Config
		opts = {
			gh = {},
			notifier = {
				top_down = false,
				style = "minimal",
			},
			lazygit = {},
			terminal = {},
			picker = {
				layout = "custom",
				layouts = {
					custom = get_custom_layout(),
					select = {
						hidden = { "preview" },
						layout = get_custom_layout().layout,
					},
				},
				sources = {
					gh_issue = {
						layouts = {
							custom = get_custom_layout(0.99),
						},
					},
					gh_pr = {
						layouts = {
							custom = get_custom_layout(0.99),
						},
					},
					smart = {},
					grep = {},
				},
			},
		},
		keys = {
			{
				"<leader>sf",
				function()
					Snacks.picker.files({ hidden = true })
				end,
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.smart({ hidden = true })
				end,
			},

			{
				"<leader>sg",
				function()
					Snacks.picker.grep({ hidden = true })
				end,
			},
			{
				"<leader>sh",
				function()
					Snacks.picker.help()
				end,
			},

			{
				"<leader>gi",
				function()
					Snacks.picker.gh_issue()
				end,
			},
			{
				"<leader>gI",
				function()
					Snacks.picker.gh_issue({ state = "all" })
				end,
			},
			{
				"<leader>gp",
				function()
					Snacks.picker.gh_pr()
				end,
			},
			{
				"<leader>gP",
				function()
					Snacks.picker.gh_pr({ state = "all" })
				end,
			},
			{
				"<leader>lg",
				function()
					Snacks.lazygit()
				end,
			},
		},
	},
}
