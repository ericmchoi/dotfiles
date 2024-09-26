return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("kanagawa")
        end,
    },
    "tpope/vim-sleuth",
    { "lewis6991/gitsigns.nvim", opts = {} },
    { "nvim-lualine/lualine.nvim", opts = {} },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
    {
        "lervag/wiki.vim",
        dependencies = {
            "ibhagwan/fzf-lua",
        },
        config = function()
            vim.g.wiki_root = "~/.wiki"
        end,
    },
}
