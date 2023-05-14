require("mason-lspconfig").setup {
    ensure_installed = { 
      "lua_ls",
      "rust_analyzer",
      "bashls",
      "cmake",
      "cssls",
      "dockerls",
      "docker_compose_language_service",
      "gopls",
      "html",
      "helm_ls",
      "jsonls",
      "tsserver",
      "marksman",
      "pyright",
      "terraformls",
      "tflint",
      "yamlls",
    },
}

