require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    integrations = {
        cmp = true,
        gitsigns = true,
        neotree = true,
        treesitter = true,
        notify = true,
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
