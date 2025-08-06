return {
	{
		dir = "~/Projects/floaty.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("floaty").setup()

			vim.keymap.set("n", "<leader>ft", function()
				require("floaty").open("terminal")
			end)

			vim.keymap.set("n", "<leader>fn", function()
				require("floaty").open("session_note")
			end)

			vim.keymap.set("n", "<leader>lg", function()
				require("floaty").open("terminal", {
					initial_cmd = "lazygit",
					id = "git_terminal",
					window_config = { title = "Lazygit" },
				})
			end)
		end,
	},
}
