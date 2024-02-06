require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "tsx",
    "typescript",
    "toml",
    "json",
    "yaml",
    "svelte",
    "css",
    "html",
    "lua"
  },
}

