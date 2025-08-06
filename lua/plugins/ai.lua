return {
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			strategies = {
				chat = {
					adapter = "anthropic",
				},
				inline = {
					adapter = "anthropic",
				},
			},
			adapters = {
				anthropic = function()
					local api_key = ""
					local handle = io.popen("pass anthropic/api_key")
					if handle then
						api_key = handle:read("*a"):gsub("%s+$", "")
						handle:close()
					end

					return require("codecompanion.adapters").extend("anthropic", {
						env = {
							api_key = api_key,
						},
					})
				end,
			},
		},
	},
}
