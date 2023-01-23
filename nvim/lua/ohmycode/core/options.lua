local opt = vim.opt

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.errorbells = false

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = true
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- Give more space for displaying messages.
opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append("c")

opt.colorcolumn = "80,100"

opt.list = false
opt.listchars:append "space:⋅"
opt.listchars:append "tab:>>"
opt.listchars:append "eol:↴"

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
