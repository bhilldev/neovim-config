vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)


local options = {
    -- Sets the number on the left-hand side.
    number = true,
    -- Sets the relative number on the left-hand side.
    relativenumber = true,
    -- Sets the number of whitespace a \t char is worth (hitting tab key on your keyboard).
    tabstop = 4,
    -- Sets the number of whitespaces which is considered as an indent.
    shiftwidth = 4,
    -- Replaces \t with whitespaces.
    expandtab = true
}

-- Appends vim.opt to all of the options we defined above; using a loop.
for k, v in pairs (options) do
    vim.opt[k] = v
end

