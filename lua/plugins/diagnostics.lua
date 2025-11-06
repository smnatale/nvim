return {
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup()
		end,
	},
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

-- Alternative to tiny-inline-diagnostic:
-- show diagnostics in a floating window on CursorHold
--
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	group = vim.api.nvim_create_augroup("auto_diagnostics_hover", { clear = true }),
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
-- 	end,
-- })
