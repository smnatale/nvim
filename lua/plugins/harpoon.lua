return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			vim.keymap.set("n", "<leader>ah", function()
				harpoon:list():add()
			end)
			vim.keymap.set("n", "<leader>h", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			for i = 1, 5, 1 do
				vim.keymap.set("n", "<C-" .. i .. ">", function()
					harpoon:list():select(i)
				end)
			end
		end,
	},
}
