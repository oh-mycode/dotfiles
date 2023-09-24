local Util = require "custom.utils"

local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
}

M.nvimtree = {
  plugin = true,
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle<CR>", "Toggle nvimtree" },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    ["<leader>ghR"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset hunk",
    },
    ["<leader>ghb"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "Blame line",
    },
    ["<leader>ghd"] = {
      function()
        package.loaded.gitsigns.diffthis()
      end,
      "Diff This",
    },
    ["<leader>ghD"] = {
      function()
        package.loaded.gitsigns.diffthis "~"
      end,
      "Diff This ~",
    },
  },
}

M.general = {
  n = {
    ["<leader>qq"] = { "<cmd>qa<cr>", "Quit all" },
    ["<leader>cp"] = {
      ":let @*=fnamemodify(expand('%'), ':~:.') . ':' . line('.')<cr>",
      "Copy Path with line number",
      opts = { noremap = true, silent = true },
    },

    -- tabs
    ["<leader><tab>l"] = { "<cmd>tablast<cr>", "Last Tab" },
    ["<leader><tab>f"] = { "<cmd>tabfirst<cr>", "First Tab" },
    ["<leader><tab><tab>"] = { "<cmd>tabnew<cr>", "New Tab" },
    ["<leader><tab>]"] = { "<cmd>tabnext<cr>", "Next Tab" },
    ["<leader><tab>d"] = { "<cmd>tabclose<cr>", "Close Tab" },
    ["<leader><tab>["] = { "<cmd>tabprevious<cr>", "Previous Tab" },

    -- git
    ["<leader>gg"] = {
      function()
        Util.float_term({ "lazygit" }, { cwd = Util.get_root(), esc_esc = false, ctrl_hjkl = false })
      end,
      "Lazygit (root dir)",
    },
    ["<leader>gG"] = {
      function()
        Util.float_term({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
      end,
      "Lazygit (cwd)",
    },
  },
}

M.telescope = require "custom.mappings.telescope"

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dT"] = {
      function()
        require("dap-python").test_method()
      end,
      "Debug test",
    },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>dB"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
      end,
      "Breakpoint Condition",
    },
    ["<leader>db"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle Breakpoint",
    },
    ["<leader>dc"] = {
      function()
        require("dap").continue()
      end,
      "Continue",
    },
    ["<leader>dC"] = {
      function()
        require("dap").run_to_cursor()
      end,
      "Run to Cursor",
    },
    ["<leader>dg"] = {
      function()
        require("dap").goto_()
      end,
      "Go to line (no execute)",
    },
    ["<leader>di"] = {
      function()
        require("dap").step_into()
      end,
      "Step Into",
    },
    ["<leader>dj"] = {
      function()
        require("dap").down()
      end,
      "Down",
    },
    ["<leader>dk"] = {
      function()
        require("dap").up()
      end,
      "Up",
    },
    ["<leader>dl"] = {
      function()
        require("dap").run_last()
      end,
      "Run Last",
    },
    ["<leader>do"] = {
      function()
        require("dap").step_out()
      end,
      "Step Out",
    },
    ["<leader>dO"] = {
      function()
        require("dap").step_over()
      end,
      "Step Over",
    },
    ["<leader>dp"] = {
      function()
        require("dap").pause()
      end,
      "Pause",
    },
    ["<leader>dr"] = {
      function()
        require("dap").repl.toggle()
      end,
      "Toggle REPL",
    },
    ["<leader>ds"] = {
      function()
        require("dap").session()
      end,
      "Session",
    },
    ["<leader>dt"] = {
      function()
        require("dap").terminate()
      end,
      "Terminate",
    },
    ["<leader>dw"] = {
      function()
        require("dap.ui.widgets").hover()
      end,
      "Widgets",
    },
  },
}

return M
