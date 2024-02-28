local notify = require("notify")
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Specify how the border looks like
local border = {
    { '┌', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '┐', 'FloatBorder' },
    { '│', 'FloatBorder' },
    { '┘', 'FloatBorder' },
    { '─', 'FloatBorder' },
    { '└', 'FloatBorder' },
    { '│', 'FloatBorder' },
}

-- Add the border on hover and on signature help popup window
local handlers = {
    ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- Add border to the diagnostic popup window
vim.diagnostic.config({
    virtual_text = {
        prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 
    },
    float = { border = border },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { buffer = 0 })
  notify(string.format("[lsp] %s\n[cwd] %s", client.name, vim.fn.getcwd()), "info", { title = "[lsp] Active" }, true)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 });
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 });
  vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = 0 });
  vim.keymap.set("n", "<leader>gr", require('telescope.builtin').lsp_references, { buffer = 0 });
  vim.keymap.set("n", "<leader>ee", function() vim.diagnostic.open_float() end, { buffer = 0 });
  vim.keymap.set("n", "[e", function() vim.diagnostic.goto_next() end, { buffer = 0 });
  vim.keymap.set("n", "]e", function() vim.diagnostic.goto_prev() end, { buffer = 0 });
end

-- SETUPS
-- Sumneko Lua
require'lspconfig'.lua_ls.setup{
  handlers = handlers,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- bash
vim.api.nvim_create_autocmd('FileType', {
  pattern = "sh",
  callback = function()
    vim.lsp.start({
      name = 'bash-language-server',
      cmd = { 'bash-language-server', 'start' },
    })
    notify("Starting Bash LSP")
  end,
})


-- Emmet
require'lspconfig'.emmet_ls.setup{ handlers = handlers }

-- HTML
require'lspconfig'.html.setup{
  capabilities = capabilities,
  handlers = handlers
}

-- CSS
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
  handlers = handlers
}

-- Biome
require'lspconfig'.biome.setup{ handlers = handlers }

-- Javascript
require'lspconfig'.eslint.setup{
  handlers = handlers,
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" },
}

--TypeScript
require'lspconfig'.tsserver.setup{
  handlers = handlers,
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
}

-- Svelte
require'lspconfig'.svelte.setup{
  handlers = handlers,
  on_attach = on_attach 
}

-- Vue
require'lspconfig'.vuels.setup{ handlers = handlers }

--Astro
require'lspconfig'.astro.setup{ handlers = handlers }

-- Tailwind
require'lspconfig'.tailwindcss.setup{ handlers = handlers }

