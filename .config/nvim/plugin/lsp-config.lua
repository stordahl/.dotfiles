-- LOCALS
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- SETUPS
-- Emmet
require'lspconfig'.emmet_ls.setup{}

-- HTML
require'lspconfig'.html.setup{ capabilities = capabilities }

-- CSS
require'lspconfig'.cssls.setup { capabilities = capabilities }

-- Javascript
require'lspconfig'.eslint.setup{
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 });
	end,
}

--TypeScript
require'lspconfig'.tsserver.setup{
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 });
	end,
}

-- Vue
require'lspconfig'.vuels.setup{}

-- Svelte
require'lspconfig'.svelte.setup{
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 });
	end,
}

--Astro
require'lspconfig'.astro.setup{}

-- Tailwind
require'lspconfig'.tailwindcss.setup{}
