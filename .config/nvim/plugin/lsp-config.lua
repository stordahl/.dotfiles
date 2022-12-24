-- LOCALS
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(_, _)     
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 });
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 });
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = 0 });
    vim.keymap.set("n", "<leader>gr", require('telescope.builtin').lsp_references, { buffer = 0 });
end

-- SETUPS
-- Emmet
require'lspconfig'.emmet_ls.setup{}

-- HTML
require'lspconfig'.html.setup{ capabilities = capabilities }

-- CSS
require'lspconfig'.cssls.setup { capabilities = capabilities }

-- Javascript
require'lspconfig'.eslint.setup{ on_attach = on_attach }

--TypeScript
require'lspconfig'.tsserver.setup{ on_attach = on_attach }

-- Svelte
require'lspconfig'.svelte.setup{ on_attach = on_attach }

-- Vue
require'lspconfig'.vuels.setup{}


--Astro
require'lspconfig'.astro.setup{}

-- Tailwind
require'lspconfig'.tailwindcss.setup{}
