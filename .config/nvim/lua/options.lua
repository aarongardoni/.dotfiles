require "nvchad.options"

-- add yours here!

local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.relativenumber = true

-- use real fzf
require('telescope').load_extension('fzf')
