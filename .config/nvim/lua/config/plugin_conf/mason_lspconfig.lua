require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
		"cmake",
		"cssls",
		"dockerls",
		"docker_compose_language_service",
		"gopls",
		"html",
		"jsonls",
		"tsserver",
		"pyright",
		"terraformls",
		"tflint",
		"yamlls",
	},
})
