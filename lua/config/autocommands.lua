-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 200, visual = true })
	end,
})

-- open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})

-- auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- syntax highlighting for dotenv files
vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("dotenv_ft", { clear = true }),
	pattern = { ".env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dosini"
	end,
})

-- show cursorline only in active window
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = vim.api.nvim_create_augroup("active_cursorline", { clear = true }),
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

-- show cursorline only in active window
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = "active_cursorline",
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("spellcheck_text", { clear = true }),
	pattern = { "gitcommit", "markdown", "text", "plaintex" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_gb"
		vim.opt_local.textwidth = 72
		vim.opt_local.wrap = true

		-- spell actions, leader sa to trigger z=
		vim.keymap.set("n", "<leader>sa", function()
			local snacks = require("snacks")
			local word = vim.fn.expand("<cword>")
			local suggestions = vim.fn.spellsuggest(word)
			if #suggestions == 0 then
				vim.notify("No spelling suggestions for '" .. word .. "'", vim.log.levels.INFO)
				return
			end

			local items = vim.tbl_map(function(s)
				return { text = s }
			end, suggestions)

			snacks.picker({
				prompt = "Spelling for: " .. word,
				items = items,
				on_confirm = function(choice)
					if choice and choice.text then
						vim.cmd("normal! ciw" .. choice.text)
					end
				end,
			})
		end)
	end,
})
