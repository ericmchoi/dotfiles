local theme = require("theme")

local background = "dark"
if theme == "rosebones" then
    background = "light"
end

local selected = {
    priority = 1000,
    init = function()
        vim.o.background = background
        vim.cmd.colorscheme(theme)
    end,
}

local colorschemes = {
    {
        themes = { "kanagawa" },
        spec = { "rebelot/kanagawa.nvim" }
    },
    {
        themes = { "kanagawabones", "rosebones" },
        spec = {
            "zenbones-theme/zenbones.nvim",
            dependencies = "rktjmp/lush.nvim",
        },
    }
}

return vim.iter(colorschemes):map(
    function(colorscheme)
        if vim.list_contains(colorscheme.themes, theme) then
            return vim.tbl_deep_extend("force", selected, colorscheme.spec)
        end

        return colorscheme.spec;
    end
):totable()
