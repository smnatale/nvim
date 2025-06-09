return {
	{
		"saghen/blink.cmp",
		dependencies = { "L3MON4D3/LuaSnip" },
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			snippets = { preset = "luasnip" },
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<C-Space>"] = { "show" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				menu = { auto_show = true },
			},
			sources = {
				default = {
					"lazydev",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
