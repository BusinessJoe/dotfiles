local lsp = require('lsp-zero').preset({})

-- If you want to install a language server for a particular file type use the command :LspInstall. And when the installation is done restart neovim.

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

local enable_virtual_text = true

-- Uses lsp commands if an lsp server is enabled for the buffer's filetype, otherwise these will use vim's default behaviours
lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    vim.keymap.set("n", "<leader>d", function ()
        enable_virtual_text = not enable_virtual_text
        vim.diagnostic.config({ virtual_text = enable_virtual_text })
    end, opts)
end)

local lspconfig = require('lspconfig')

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            plugins = {
                ruff = {
                    enabled = true,
                    lineLength = 88,
                },
                jedi_signature_help = { enabled = true },
                flake8 = { maxLineLength = 88 },
                pycodestyle = { maxLineLength = 88 },
            }
        }
    }
}

lspconfig.lua_ls.setup {
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
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

lspconfig.svelte.setup {}

lspconfig.rust_analyzer.setup {
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true
            }
        }
    }
}

lsp.setup()
