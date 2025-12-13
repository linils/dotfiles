vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowrite = false
vim.opt.backup = false
vim.opt.compatible = false
vim.opt.confirm = false
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.diff = false
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.modeline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.paste = false
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.smartcase = false
vim.opt.smartindent = true
vim.opt.spell = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeout = true
vim.opt.title = false
vim.opt.ttyfast = true
vim.opt.undofile = true
vim.opt.visualbell = false
vim.opt.wrap = false
vim.opt.writebackup = false

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.scrolloff = 10
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.shiftwidth = 8

vim.g.mapleader = " "

vim.keymap.set('n', "<leader>o", ":update<CR> :source <CR>")
vim.keymap.set('n', "<leader>w", ":write<CR>")
vim.keymap.set('n', "<leader>q", ":quit<CR>")
vim.keymap.set('n', "<leader>b", ":bp<CR>")

vim.pack.add({
        { src = "https://github.com/stevearc/oil.nvim" },
        { src = "https://github.com/echasnovski/mini.pick" },
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/nvim-mini/mini.completion" },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
        { src = "https://github.com/psliwka/termcolors.nvim" },
        { src = "https://github.com/p00f/alabaster.nvim" },
})

require("mini.pick").setup()
require("oil").setup()

require("mini.completion").setup({
        delay = { completion = 100000 },
        lsp_completion = { auto_setup = true },
})
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", { noremap = true })

vim.keymap.set('n', "<leader>f", ":Pick files<CR>")
vim.keymap.set('n', "<leader>h", ":Pick help<CR>")
vim.keymap.set('n', "<leader>g", ":Pick grep_live<CR>")

vim.lsp.enable({ "lua_ls", "clangd" })
vim.keymap.set('n', "<leader>lf", vim.lsp.buf.format)
vim.keymap.set('n', "<leader>ld", vim.lsp.buf.definition)
vim.keymap.set('n', "<leader>lr", vim.lsp.buf.rename)

require("nvim-treesitter.configs").setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
        ignore_install = {},
        sync_install = false,
        highlight = { enable = true },
        auto_install = true,
})


vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = false,
        float = true,
})

vim.cmd(":hi statusline guibg=NONE")
vim.cmd.colorscheme("alabaster")
