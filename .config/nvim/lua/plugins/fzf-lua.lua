return {
    "ibhagwan/fzf-lua",
    config = function()
        require("fzf-lua").setup({})
        vim.keymap.set("n", "<leader>ff", require('fzf-lua').files, {})
        vim.keymap.set("n", "<leader>fg", function()
            require('fzf-lua').live_grep({
                rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden -g '!.git' -e",
            })
        end, {})
    end,
}
