return {
  "christoomey/vim-tmux-navigator",
  keys = {
    { "<C-h>", ":TmuxNavigateLeft<CR>", noremap = true, silent = true, desc = "Tmux go left panel" },
    { "<C-j>", ":TmuxNavigateDown<CR>", noremap = true, silent = true, desc = "Tmux go down panel" },
    { "<C-k>", ":TmuxNavigateUp<CR>", noremap = true, silent = true, desc = "Tmux go up panel" },
    { "<C-l>", ":TmuxNavigateRight<CR>", noremap = true, silent = true, desc = "Tmux go right panel" },
    -- { "<C-p>", ":TmuxNavigatePrevious<CR>", noremap = true, silent = true, desc = "Tmux go previous panel" },
  },
}
