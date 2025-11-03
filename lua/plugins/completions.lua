return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
				{ path = "lazy.nvim", words = { "LazyVim" } },
			},
		},
	},
	{
		"Saghen/blink.cmp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"tpope/vim-dadbod",
			"kristijanhusak/vim-dadbod-completion",
			"kristijanhusak/vim-dadbod-ui",
		},
		opts = {
			snippets = { preset = "luasnip" },
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<C-Space>"] = { "show" },
				["<Down>"] = { "select_next", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
			},
			completion = {
				menu = {
					auto_show = true,
					draw = {
						treesitter = { "lsp" },
						columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
					},
				},
				documentation = { auto_show = true },
			},
			signature = { enabled = true },
			fuzzy = { implementation = "lua" },
			sources = {
				default = {
					"lazydev",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				per_filetype = {
					sql = { "snippets", "dadbod", "buffer" },
				},
				providers = {
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
		},
		config = function(_, opts)
			require("luasnip.loaders.from_vscode").load()
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
			require("blink.cmp").setup(opts)
		end,
	},
}
