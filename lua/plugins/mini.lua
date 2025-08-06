return {
	{
		"echasnovski/mini.pick",
		keys = {
			{ "<leader>sf", "<cmd>Pick files<cr>" },
			{ "<leader>sg", "<cmd>Pick grep_live<cr>" },
			{ "<leader>sh", "<cmd>Pick help<cr>" },
		},
		dependencies = {
			"echasnovski/mini.icons",
			"echasnovski/mini.notify",
			"echasnovski/mini.pairs",
		},
		config = function()
			require("mini.icons").setup()
			require("mini.icons").mock_nvim_web_devicons()

			require("mini.notify").setup()
			require("mini.pairs").setup()

			require("mini.pick").setup()
			vim.ui.select = MiniPick.ui_select
		end,
	},
}
