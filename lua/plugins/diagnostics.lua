return {
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"artemave/workspace-diagnostics.nvim",
		config = function()
			require("workspace-diagnostics").setup({
				workspace_files = function()
					local gitPath = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
					local cmd = string.format(
						"git -C %s ls-files --exclude-standard --cached --others -- ':!*.yarn/**'",
						gitPath
					)
					local workspace_files = vim.fn.split(vim.fn.system(cmd), "\n")

					return workspace_files
				end,
			})
		end,
	},
}
