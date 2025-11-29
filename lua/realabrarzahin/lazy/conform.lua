return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
			},

			format_on_save = function(bufnr)
				-- Set this to false if you want manual-only formatting
				return {
					lsp_fallback = false, -- do NOT fall back to LSP formatting
					timeout_ms = 2000,
				}
			end,

			-- Optional: override how uncrustify/stylua are called (paths, args)
			-- formatters = {
			--     uncrustify = {
			--         command = "uncrustify",
			--         args = { "-q", "-l", "C", "-c", "/path/to/.uncrustify.cfg", "-" },
			--         stdin = true,
			--     },
			--     stylua = {
			--         command = "stylua",
			--         args = { "--search-parent-directories", "--stdin-filepath", "$FILENAME", "-" },
			--         stdin = true,
			--     },
			-- },
		})

		-- Manual format keymap
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = false,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file or range" })
	end,
}
