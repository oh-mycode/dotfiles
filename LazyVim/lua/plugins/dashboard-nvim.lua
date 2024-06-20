return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    opts.config.header = vim.tbl_map(function()
      return ""
    end, vim.fn.range(15))
  end,
}
