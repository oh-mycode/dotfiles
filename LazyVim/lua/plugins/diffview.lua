return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>gW",
      ":'<,'>DiffviewFileHistory<CR>",
      mode = { "v" },
      noremap = true,
      silent = true,
      desc = "Diff view log",
    },
  },
}
