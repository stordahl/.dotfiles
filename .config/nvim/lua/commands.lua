vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { '*.tsx', '*.ts', '*.jsx', '*.js', '*.svelte', '*.cjs', '*.mjs', '*.json' },
    command = 'silent! EslintFixAll',
    group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
})