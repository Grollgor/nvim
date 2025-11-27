return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true, cs = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 5000,
          lsp_format = "fallback",
        }
      end
    end,
    formatters_by_ft = {
      lua = { "stylua" },
    },
    formatters = {
      stylua = {
        args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
          "--search-parent-directories",
          "--stdin-filepath",
          "$FILENAME",
          "-",
        },
      },
    },
  },
}
