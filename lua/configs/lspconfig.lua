require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "tsserver",
  "rust_analyzer",
  "pyright",
  "gopls",
  "clangd",
  "lua_ls",
}
vim.lsp.enable(servers)

vim.lsp.util.open_floating_preview = (function(orig)
  return function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.focusable = false
    opts.border = "rounded"
    return orig(contents, syntax, opts, ...)
  end
end)(vim.lsp.util.open_floating_preview)
-- read :h vim.lsp.config for changing options of lsp servers 
