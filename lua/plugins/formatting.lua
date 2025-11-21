return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			graphql = { "prettierd" },
			go = { "goimports", "gofmt" },
		},
	},
}
