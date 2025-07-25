local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "D", "dd", opts)
keymap({ "n", "v" }, "H", "^", opts)
keymap({ "n", "v" }, "L", "$", opts)

keymap("n", "gd", vim.lsp.buf.definition, opts)
keymap("n", "<C-f>", vim.lsp.buf.format, opts)
keymap("n", "<C-r>", vim.lsp.buf.rename, opts)
keymap("n", "<leader>h", "<cmd>ClangdSwitchSourceHeader<CR>", opts)
