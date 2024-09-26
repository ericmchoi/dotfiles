return {
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
}
