return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "stylua",
        "ols",
      },
    },
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
          },
          ensure_installed = {
            "roslyn",
            "rzls",
          },
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
}
