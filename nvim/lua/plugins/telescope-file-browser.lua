return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },

  config = function()
    require("telescope").setup {
      defaults = {
        -- Optional: Customize your telescope defaults here
      },
      extensions = {
        file_browser = {
          theme = "ivy", -- Use the Ivy theme for a compact, bottom-aligned layout
          hijack_netrw = true, -- Replace netrw with telescope-file-browser
          mappings = {
            ["i"] = { -- Insert mode custom mappings
              ["<A-c>"] = require("telescope._extensions.file_browser.actions").create,
              ["<A-r>"] = require("telescope._extensions.file_browser.actions").rename,
              ["<A-d>"] = require("telescope._extensions.file_browser.actions").remove,
              ["<C-h>"] = require("telescope._extensions.file_browser.actions").toggle_hidden,
            },
            ["n"] = { -- Normal mode custom mappings
              ["c"] = require("telescope._extensions.file_browser.actions").create,
              ["r"] = require("telescope._extensions.file_browser.actions").rename,
              ["d"] = require("telescope._extensions.file_browser.actions").remove,
              ["h"] = require("telescope._extensions.file_browser.actions").toggle_hidden,
            },
          },
        },
      },
    }

    -- Load the file-browser extension
    require("telescope").load_extension("file_browser")

    -- Keymap for launching the file browser
    vim.keymap.set("n", "<space>fb", function()
      require("telescope").extensions.file_browser.file_browser {
        path = "%:p:h", -- Start at the directory of the current buffer
        select_buffer = true, -- Select the current buffer if possible
      }
    end, { desc = "Open Telescope File Browser" })
  end,
}

