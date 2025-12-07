vim.opt.clipboard = "unnamedplus"

vim.keymap.set("i", "jj", "<Esc>", {})
vim.keymap.set("i", "<C-H>", "<C-w>", { noremap = true })

vim.opt.fillchars = { vert = "│" }

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to Left Split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to Down Split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to Up Split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to Right Split" })
vim.keymap.set("n", "<C-c>", "<C-w>c", { desc = "Close Current Split" })
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader><leader>", ":nohlsearch<cr>", { silent = true })

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.keymap.set("n", "<leader>ct", function()
	local template = vim.fn.expand("/home/realabrarzahin/.config/nvim/lua/realabrarzahin/templates/cp_template.cpp")
	vim.cmd("0r " .. template)
end, { desc = "Insert CP Template" })

vim.keymap.set("n", "<leader>ex", function()
	vim.cmd("wq")
	vim.cmd("wq")
	vim.cmd("wq")
end)

vim.keymap.set("n", "<leader>s", function()
	local total_cols = vim.opt.columns:get()
	local split_width = math.floor(total_cols / 4)
	vim.cmd(split_width .. "vsplit in")
	vim.cmd("split out")
	vim.cmd("wincmd h")
end)

local term_buf_nr = nil

vim.keymap.set("n", "<leader>cc", function()
	if vim.bo.filetype == "cpp" then
		return ":w<CR>:!g++ % && ./a.out < in | > out<CR>"
	elseif vim.bo.filetype == "c" then
		return ":w<CR>:!gcc % && ./a.out < in | > out<CR>"
	end
	return ""
end, { expr = true, silent = true })

vim.keymap.set("n", "<leader>pi", function()
	local main_win = vim.api.nvim_get_current_win()

	vim.cmd("wincmd l")
	vim.cmd("wincmd k")
	vim.cmd('normal! ggVG"+p')
	vim.cmd("w")

	vim.api.nvim_set_current_win(main_win)
end, { desc = "Paste clipboard into in file" })

vim.keymap.set("n", "<leader>ci", function()
	vim.cmd("wincmd l")
	vim.cmd("wincmd k")
	vim.cmd("normal! Go")
	vim.api.nvim_feedkeys("i", "n", false)
end)

vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3b3b3b", bg = "NONE", bold = false })
vim.api.nvim_set_hl(0, "NormalNC", { link = "Normal" })
vim.opt.statusline = " %f %h%m%r %= %y [%{&fileformat}] %l:%c [%p%%] "
