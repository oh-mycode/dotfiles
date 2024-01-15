return {
  "nvim-telescope/telescope-file-browser.nvim",
  keys = {
    {
      "<leader>sB",
      ":Telescope file_browser <cr>",
      desc = "Browse Files",
    },
  },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
