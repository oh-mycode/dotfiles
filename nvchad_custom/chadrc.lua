---@type ChadrcConfig
local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.relativenumber = true

opt.smartindent = true
-- opt.smartcase = false

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.undofile = true

opt.list = false
opt.listchars:append "space:⋅"
opt.listchars:append "tab:>>"
opt.listchars:append "eol:↴"

opt.spelllang = "en_us"
opt.spell = false

local M = {}

M.ui = {
  theme = "catppuccin",
  statusline = {
    theme = "vscode_colored",
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

-- vim.cmd.colorscheme "catppuccin"

return M
