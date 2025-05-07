local M = require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- diagnostic float
map('n', '<leader>df', vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- tmux
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- leaderff to search files in git
map("n", "<leader>ff", "<cmd>Telescope git_files<CR>", { desc = "Find files in git" })
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Find git branches" })
map("n", "<leader>fs", function()
  require("telescope.builtin").live_grep({ additional_args = { "--hidden" } })
end, { desc = "telescope live grep hidden files" })


-- copilot
map("i", "<leader>cc",
  function()
    vim.fn.feedkeys(vim.fn['copilot#Accept'](), '')
  end,
  { desc = "Copilot Accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

-- Go debug
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
map("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", { desc = "Continue" })
map("n", "<leader>dgt", "<cmd>lua require('dap-go').debug_test()<CR>", { desc = "Debug test" })
map("n", "<leader>dus",
  function()
    local widgets = require('dap.ui.widgets');
    local sidebar = widgets.sidebar(widgets.scopes);
    sidebar.open();
  end,
  { desc = "Open sidebar" })
