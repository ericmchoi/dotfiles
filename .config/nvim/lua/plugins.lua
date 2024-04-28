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
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            telescope.load_extension("fzf")
            telescope.setup({
                pickers = { find_files = { find_command = { "rg", "--files", "--hidden", "-g", "!.git" } } },
            })

            vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
            vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
            vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
            vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            { "folke/neodev.nvim", opts = {} },
        },
        config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = event.buf })
                    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = event.buf })
                    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = event.buf })
                    vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer = event.buf })
                    vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { buffer = event.buf })
                    vim.keymap.set("n", "cf", vim.lsp.buf.format, { buffer = event.buf })
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf })
                end,
            })
            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                callback = function(event)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "lsp-attach", buffer = event.buf })
                end,
            })

            local capabilities = vim.tbl_deep_extend(
                "force",
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )

            local servers = {
                clangd = {
                    settings = {
                        cmd = {
                            "clangd",
                            "--function-arg-placeholders=0",
                        },
                    },
                },
            }

            require("mason").setup()
            require("mason-lspconfig").setup({
                handlers = {
                    function(server)
                        local server_options = servers[server] or {}
                        server_options.capabilities = capabilities
                        require("lspconfig")[server].setup(server_options)
                    end,
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            luasnip.config.setup({})

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-l>"] = cmp.mapping(function()
                        if luasnip.expand_or_locally_jumpable() then
                            luasnip.expand_or_jump()
                        end
                    end, { "i", "s" }),
                    ["<C-h>"] = cmp.mapping(function()
                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                }),
            })
        end,
    },
}
