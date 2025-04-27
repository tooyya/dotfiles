-- LSP設定
local lspconfig = require('lspconfig')

-- キーマッピングの設定
local on_attach = function(client, bufnr)
  local function buf_set_keymap(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    opts.buffer = bufnr
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- 各種LSP機能のキーバインド
  buf_set_keymap('n', 'gD', vim.lsp.buf.declaration, { desc = "Go to declaration" })
  buf_set_keymap('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
  buf_set_keymap('n', 'K', vim.lsp.buf.hover, { desc = "Show hover info" })
  buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, { desc = "Go to implementation" })
  buf_set_keymap('n', '<C-k>', vim.lsp.buf.signature_help, { desc = "Show signature help" })
  buf_set_keymap('n', '<leader>D', vim.lsp.buf.type_definition, { desc = "Go to type definition" })
  buf_set_keymap('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
  buf_set_keymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
  buf_set_keymap('n', 'gr', vim.lsp.buf.references, { desc = "Show references" })
  buf_set_keymap('n', '<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, { desc = "Format code" })
end

-- LSPの機能設定
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- LSPサーバーの設定
-- Nixで管理するLSPサーバーの設定
-- 例: TS/JS用のTypeScriptサーバー
lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- Lua用のLSP
lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Nix用のLSP
lspconfig.nil_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- 他の言語サーバーもここに追加可能

-- 診断表示の設定
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    severity = nil,
    source = "if_many",
  },
  float = {
    source = "always",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- エラーサインの設定
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- nvim-cmpの設定
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      -- スニペット展開の機能（必要に応じてスニペットエンジンを設定）
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})
