require("options")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- colorscheme
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme kanagawa]])
        end,
    },
    -- detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",
    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            {
                "williamboman/mason.nvim",
                build = function()
                    require("mason.api.command").MasonUpdate()
                end,
            },
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
        },
    },
    -- indent indicators
    "lukas-reineke/indent-blankline.nvim",
    -- adds git symbols to line number
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
    },
    -- fancy vim status line
    {
        "nvim-lualine/lualine.nvim",
        opts = {},
    },
    -- fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function()
            require("telescope").load_extension("fzf")
        end,
    },
    -- Highlight, edit, and navigate code
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = {
                enable = true,
            },
        },
    },
})

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})

local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
