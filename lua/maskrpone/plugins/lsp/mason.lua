local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver", -- for javascript
		"html", -- for html
		"cssls", -- for css
		"sumneko_lua", -- for lua
		"clangd", -- for C/C++
		"cmake", -- for cmake
		"texlab", -- for latex
		"marksman", -- for markdown
		"intelephense", -- for php
		"jedi_language_server", -- for python
	},
})

mason_null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
	},
})
