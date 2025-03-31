return {
	-- Set move controls for blocks of selected text
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv"),
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv"),

	-- Set highlight on search, but clear on pressing <Esc> in normal mode
	vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>"),

	--require("zellij-nav").setup()
	--
	--vim.keymap.set("n", "<M-h>", "<cmd>ZellijNavigateLeftTab<cr>", { desc = "Move focus to the left window" })
	--vim.keymap.set("n", "<M-l>", "<cmd>ZellijNavigateRightTab<cr>", { desc = "Move focus to the right window" })
	--vim.keymap.set("n", "<M-j>", "<cmd>ZellijNavigateDown<cr>", { desc = "Move focus to the lower window" })
	--vim.keymap.set("n", "<M-k>", "<cmd>ZellijNavigateUp<cr>", { desc = "Move focus to the upper window" })

	-- Diagnostic keymaps
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" }),
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" }),
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" }),
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" }),
}
