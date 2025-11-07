return {
	{
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

			local ts_inlay_hints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			}

			vim.lsp.config("ts_ls", {
				settings = {
					typescript = {
						inlayHints = ts_inlay_hints,
					},
					javascript = {
						inlayHints = ts_inlay_hints,
					},
				},
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						hint = { enable = true },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
					},
				},
			})

			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						hints = {
							rangeVariableTypes = true,
							parameterNames = true,
							constantValues = true,
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							functionTypeParameters = true,
						},
						completeUnimported = true,
						usePlaceholders = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
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

					vim.keymap.set("n", "<leader>f", function()
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

			---@type table<number, {token:lsp.ProgressToken, msg:string, done:boolean}[]>
			local progress = vim.defaulttable()
			vim.api.nvim_create_autocmd("LspProgress", {
				---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
					if not client or type(value) ~= "table" then
						return
					end
					local p = progress[client.id]

					for i = 1, #p + 1 do
						if i == #p + 1 or p[i].token == ev.data.params.token then
							p[i] = {
								token = ev.data.params.token,
								msg = ("[%3d%%] %s%s"):format(
									value.kind == "end" and 100 or value.percentage or 100,
									value.title or "",
									value.message and (" **%s**"):format(value.message) or ""
								),
								done = value.kind == "end",
							}
							break
						end
					end

					local msg = {} ---@type string[]
					progress[client.id] = vim.tbl_filter(function(v)
						return table.insert(msg, v.msg) or not v.done
					end, p)

					local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
					vim.notify(table.concat(msg, "\n"), "info", {
						id = "lsp_progress",
						title = client.name,
						opts = function(notif)
							notif.icon = #progress[client.id] == 0 and " "
								or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
						end,
					})
				end,
			})
		end,
	},
}
