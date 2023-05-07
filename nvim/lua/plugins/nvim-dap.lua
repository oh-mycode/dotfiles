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
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
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
