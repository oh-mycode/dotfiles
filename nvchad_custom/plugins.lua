local plugins = {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>gh",
        ":'<,'>DiffviewFileHistory<CR>",
        mode = { "v" },
        noremap = true,
        silent = true,
        desc = "Diff view log",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "prettier",
        "debugpy",
        "pyright",
        "ruff",
        "black",
        "isort",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      ft = { "python" },
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      -- local Config = require("lazyvim.config")
      -- vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
      --
      -- for name, sign in pairs(Config.icons.dap) do
      --   sign = type(sign) == "table" and sign or { sign }
      --   vim.fn.sign_define(
      --     "Dap" .. name,
      --     { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      --   )
      -- end
      require("nvim-dap-virtual-text").setup {
        commented = true,
      }
      require("core.utils").load_mappings "dap"
      require("dap.ext.vscode").load_launchjs(nil, { python = { "python" } })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function(_, opts)
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup(opts)

      local debug_win = nil
      local debug_tab = nil
      local debug_tabnr = nil

      local function open_in_tab()
        if debug_win and vim.api.nvim_win_is_valid(debug_win) then
          vim.api.nvim_set_current_win(debug_win)
          return
        end

        vim.cmd "tabedit %"
        debug_win = vim.fn.win_getid()
        debug_tab = vim.api.nvim_win_get_tabpage(debug_win)
        debug_tabnr = vim.api.nvim_tabpage_get_number(debug_tab)

        dapui.open {}
      end

      local function close_tab()
        dapui.close {}

        if debug_tab and vim.api.nvim_tabpage_is_valid(debug_tab) then
          vim.api.nvim_exec("tabclose " .. debug_tabnr, false)
        end

        debug_win = nil
        debug_tab = nil
        debug_tabnr = nil
      end

      -- Attach DAP UI to DAP events
      dap.listeners.after.event_initialized["dapui_config"] = function()
        open_in_tab()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        close_tab()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        close_tab()
      end
    end,
  },
  { "theHamsta/nvim-dap-virtual-text" },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local dap_python = require "dap-python"
      dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python", {})
      dap_python.test_runner = "pytest"
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>cu", ":UndotreeToggle<CR>", noremap = true, silent = true, desc = "UndoTree" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension "fzf"
      end,
    },
  },
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   vscode = true,
  --   ---@type Flash.Config
  --   opts = {},
  --   -- stylua: ignore
  --   keys = {
  --     { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
  --     { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
  --     { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
  --     { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --     { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  --   },
  -- },
  -- mini
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },
  {
    "echasnovski/mini.surround",
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find right surrounding" },
        { opts.mappings.find_left, desc = "Find left surrounding" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
  },
}

return plugins
