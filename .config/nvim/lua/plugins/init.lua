return {
  -- { import = "nvchad.blink.lazyspec" },
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },                       -- These are some examples, uncomment them if you want to see them work!
  {

    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp", "prettier",
        "zls", "gopls", "yaml-language-server",
      },
    },
  },
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()
      -- Mapping tab is already used by NvChad
      vim.g.copilot_no_tab_map = true;
      vim.g.copilot_assume_mapped = true;
      vim.g.copilot_tab_fallback = "";
      -- The mapping is set to other key, see custom/lua/mappings
      -- or run <leader>ch to see copilot mapping section
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    lazy = false,
    config = function()
      local actions = require "telescope.actions"
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
            n = {
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
          },
        },
      }
      require("telescope").load_extension("fzf")
    end
  },
  {
    'leoluz/nvim-dap-go',
    ft = "go", -- This will lazy-load the plugin only for Go files
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("dap-go").setup {
        dap_configurations = {
          {
            type = "go",
            name = "Debug Main File",
            request = "launch",
            program = "${file}", -- This will debug the currently opened file
          },
        },
      }
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    opts = {
      view = {
        side = "left"
      }
    }
  }
}
