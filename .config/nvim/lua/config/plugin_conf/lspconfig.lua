-- Pyright (Python)
vim.lsp.config('pyright', {})

-- TypeScript/JavaScript
vim.lsp.config('ts_ls', {})

-- Go
vim.lsp.config('gopls', {})

-- C/C++
-- Use clangd from NixOS' clang-tools package instead of Mason's dynamically
-- linked binary.
vim.lsp.config('clangd', {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

-- Terraform
vim.lsp.config('terraformls', {
  filetypes = { "terraform", "hcl" },
})

-- YAML
vim.lsp.config('yamlls', {
  settings = {
    yaml = {
      format = {
        enable = true,
      },
      completion = true,
    },
  },
})

-- Lua
vim.lsp.config('lua_ls', {
  -- Use the native Nix package. Mason's generic dynamically linked binary
  -- cannot execute on NixOS.
  cmd = { vim.fn.expand("~/.nix-profile/bin/lua-language-server") },
  root_dir = function(bufnr, on_dir)
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local home = vim.uv.fs_realpath(vim.env.HOME)
    local root = vim.fs.root(filename, {
      ".emmyrc.json",
      ".luarc.json",
      ".luarc.jsonc",
      ".luacheckrc",
      ".stylua.toml",
      "stylua.toml",
      "selene.toml",
      "selene.yml",
      ".git",
    })

    -- $HOME is itself a dotfiles Git repository. Never let LuaLS index the
    -- entire home directory because of that marker.
    if root and vim.uv.fs_realpath(root) == home then
      local parent = vim.fs.dirname(filename)
      if vim.uv.fs_realpath(parent) == home then
        return
      end
      root = parent
    end

    on_dir(root or vim.fs.dirname(filename))
  end,
  -- Lua language server settings
  -- See `:help lspconfig-lua`
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Recognize 'vim' as a global variable
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Include Neovim runtime files
      },
      telemetry = {
        enable = false, -- Disable telemetry
      },
    },
  },
})

-- JSON
vim.lsp.config('jsonls', {})

-- Rust
vim.lsp.config('rust_analyzer', {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ["rust-analyzer"] = {},
  },
})

-- Helm
vim.lsp.config('helm_ls', {
  -- For root_dir, we need to use vim.fs.find instead of lspconfig.util
  root_dir = function(fname)
    -- Look for Chart.yaml or .git directory
    local root_markers = vim.fs.find({ "Chart.yaml", ".git" }, {
      upward = true,
      path = vim.fs.dirname(fname),
    })[1]

    return root_markers and vim.fs.dirname(root_markers) or nil
  end,
  settings = {
    ['helm-ls'] = {
      helmLint = {
        enabled = true,
      },
      yamlls = {
        enabled = false,
      },
    },
  },
})

-- Enable all configured language servers
-- Note: vim.lsp.enable() is used to enable a config
vim.lsp.enable('pyright')
vim.lsp.enable('ts_ls')
vim.lsp.enable('gopls')
vim.lsp.enable('clangd')
vim.lsp.enable('terraformls')
vim.lsp.enable('yamlls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('jsonls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('helm_ls')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>f", function()
      require("conform").format({
        async      = true,
        lsp_format = "fallback",
      })
    end, opts)
  end,
})

-- Format on save
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
