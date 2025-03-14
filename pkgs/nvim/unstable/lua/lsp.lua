local lspconfig = require('lspconfig')

lspconfig['gopls'].setup { }
lspconfig['jdtls'].setup { }
lspconfig['lua_ls'].setup { }
lspconfig['nil_ls'].setup { }
lspconfig['ts_ls'].setup { }

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '●',
    source = 'always',
  },
  signs = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticError', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticWarn', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticInfo', linehl = '', numhl = '' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticHint', linehl = '', numhl = '' })
