return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"rachartier/tiny-code-action.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"prettierd",
				"eslint-lsp",
				"lua_ls",
				"tailwindcss-language-server",
				"ts_ls",
				"gopls",
				"graphql",
				"goimports",
				"copilot",
			},
			auto_update = false,
			run_on_start = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

				vim.keymap.set({ "n", "x" }, "<leader>ca", function()
					require("tiny-code-action").code_action()
				end, { noremap = true, silent = true })

				vim.keymap.set("n", "<leader>li", function()
					if vim.bo.filetype == "typescript" or vim.bo.filetype == "typescriptreact" then
						vim.lsp.buf.code_action({
							apply = true,
							---@diagnostic disable-next-line: assign-type-mismatch
							context = { only = { "source.removeUnused.ts" }, diagnostics = {} },
						})
						vim.defer_fn(function()
							vim.lsp.buf.format({ timeout_ms = 10000 })
						end, 100) -- 100ms delay
					else
						vim.lsp.buf.format({ timeout_ms = 10000 })
					end
				end)

				vim.keymap.set("n", "<leader>d", function()
					vim.diagnostic.open_float({
						border = "rounded",
					})
				end, opts)
			end,
		})
	end,
}
