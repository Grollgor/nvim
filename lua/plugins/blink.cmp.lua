return {
  "saghen/blink.cmp",
  event = "VimEnter",
  version = "1.*",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "2.*",
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
    },
    "folke/lazydev.nvim",
  },
  config = function()
    local blink = require("blink.cmp")
    blink.setup(
      ---@module "blink.cmp"
      ---@type blink.cmp.Config
      {
        keymap = {
          preset = "default",
        },
        appearance = {
          nerd_font_variant = "mono",
        },
        completion = {
          menu = {
            auto_show = true,
          },
          ghost_text = {
            show_with_menu = true,
            enabled = true,
          },
          keyword = {
            range = "full",
          },
          documentation = { auto_show = false, auto_show_delay_ms = 500 },
          accept = {
            auto_brackets = {
              enabled = true,
            },
          },
        },
        sources = {
          default = { "lsp", "path", "snippets", "lazydev" },
          providers = {
            lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
          },
        },
        snippets = {
          preset = "luasnip",
        },
        fuzzy = {
          implementation = "lua",
        },
        signature = {
          enabled = true,
        },
      }
    )

    local capabilities = blink.get_lsp_capabilities()
    vim.lsp.config("*", {
      capabilities = capabilities,
    })
  end,
}
