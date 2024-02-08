require("mason").setup()
require("mason-lspconfig").setup()

lspconfig = require("lspconfig")

lsp_installer = require("mason-lspconfig")

local servers = {
    "jsonls",
    "rust_analyzer",
    "jdtls",
    "lua_ls",
    "gopls",
    "tsserver",
    "pyright",
    "html",
    "clangd",
    "tailwindcss",
    "emmet_ls",
    "dockerls",
    "bashls",
    "yamlls",
    "terraformls",
    "tflint",
    "golangci_lint_ls",
}

lsp_installer.setup({
    ensure_installed = servers,
})

for _, server in pairs(servers) do
    local opts = {
        on_attach = require("mack.lsp.handlers").on_attach,
        capabilities = require("mack.lsp.handlers").capabilities,
    }
    local has_custom_opts, server_custom_opts = pcall(require, "mack.lsp.settings." .. server)
    if has_custom_opts then
        opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
    end
    lspconfig[server].setup(opts)
end