return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 5000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "prettierd", "prettier", stop_after_first = true },
			graphql = { "prettierd", "prettier", stop_after_first = true },
			sql = { "sql_formatter" },
			go = { "goimports", "gofmt" },
		},
	},
}
