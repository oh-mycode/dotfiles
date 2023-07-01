return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<leader>cDb",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>cDr",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>cDo",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>cDi",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>cDu",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
    },
    init = function()
      require("dap.ext.vscode").load_launchjs(nil, { python = { "python" } })
      vim.fn.sign_define("DapBreakpoint", { text = "🐞", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({})
      local debug_win = nil
      local debug_tab = nil
      local debug_tabnr = nil

      local function open_in_tab()
        if debug_win and vim.api.nvim_win_is_valid(debug_win) then
          vim.api.nvim_set_current_win(debug_win)
          return
        end

        vim.cmd("tabedit %")
        debug_win = vim.fn.win_getid()
        debug_tab = vim.api.nvim_win_get_tabpage(debug_win)
        debug_tabnr = vim.api.nvim_tabpage_get_number(debug_tab)

        dapui.open()
      end

      local function close_tab()
        dapui.close()

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
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "python" },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "jay-babu/mason-nvim-dap.nvim",
    },
    -- opts = {
    --   adapter_python_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
    -- },
    -- init = function()
    --   require("dap-python").test_runner = "pytest"
    -- end,
    config = function()
      local dap_python = require("dap-python")
      dap_python.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python", {})
      dap_python.test_runner = "pytest"
    end,
  },
  { "nvim-telescope/telescope-dap.nvim" },
}
