-- Disable Space bar since it'll be used as the leader key
vim.keymap.set("n", "<leader>", "<nop>")
vim.keymap.set("v", "<leader>", "<nop>")

-- Redo remap
vim.keymap.set("n", "U", "<C-r>")

-- Swap between split buffers
vim.keymap.set("n", "<C-Left>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-Down>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-Up>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-Right>", ":wincmd l<CR>")

-- Save and quit current file quicker
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = false })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { silent = false })

-- Little one from Primeagen to mass replace string in a file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

-- Navigate through buffers
vim.keymap.set("n", "<S-Right>", ":bnext<CR>", { silent = false })
vim.keymap.set("n", "<S-Left>", ":bprevious<CR>", { silent = false })

-- Close currently active buffer
vim.keymap.set("n", "<C-c>", ":bwipeout<CR>", { silent = false })

-- Center buffer when navigating up and down
vim.keymap.set("n", "<S-Up>", "<C-u>zz")
vim.keymap.set("n", "<S-Down>", "<C-d>zz")

-- Center buffer when progressing through search results
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without replacing paste with what you are highlighted over
vim.keymap.set("n", "<leader>p", '"_dP')

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Open buffer to the right
vim.keymap.set("n", "<leader>v", ":vsplit<CR>")

-- Move selection up and down
vim.keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv")
