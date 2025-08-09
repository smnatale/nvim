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
			require("mini.notify").setup()
			vim.notify = MiniNotify.make_notify()

			require("mini.pairs").setup()

			require("mini.pick").setup()
			vim.ui.select = MiniPick.ui_select
		end,
	},
}
