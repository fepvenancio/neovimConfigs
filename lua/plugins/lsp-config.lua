return {
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "golangci_lint_ls",
          "gopls",
          "graphql",
          "htmx",
          "jsonls",
          "tsserver",
          "solc",
          "solidity",
          "solidity_ls_nomicfoundation"
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.graphql.setup({})
      lspconfig.solidity.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover,{})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>vrn", function(client, bufnr) vim.lsp.buf.rename() end, { buffer = bufnr, remap = false}, {desc = "LSP Rename"})
    end
  }
}
