return {
    {
        "Shatur/neovim-ayu",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme ayu-mirage]])
            vim.cmd([[highlight WinSeparator guifg=#bebebe guibg=#192330]])
        end,
    }
}
