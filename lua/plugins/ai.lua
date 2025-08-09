return {
	{
		"NickvanDyke/opencode.nvim",
		dependencies = { "folke/snacks.nvim" },
		opts = {
			auto_fallback_to_embedded = false,
		},
		keys = {
			{
				"<leader>oa",
				function()
					require("opencode").ask()
				end,
				desc = "Ask opencode",
				mode = "n",
			},
			{
				"<leader>oa",
				function()
					require("opencode").ask("@selection: ")
				end,
				desc = "Ask opencode about selection",
				mode = "v",
			},
			{
				"<leader>op",
				function()
					require("opencode").select_prompt()
				end,
				desc = "Select prompt",
				mode = { "n", "v" },
			},
		},
	},
}
