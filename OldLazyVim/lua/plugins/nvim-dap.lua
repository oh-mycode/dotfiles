return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup(opts)

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

          dapui.open({})
        end

        local function close_tab()
          dapui.close({})

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
      "mfussenegger/nvim-dap-python",
      dependencies = {
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
  },

  config = function()
    local Config = require("lazyvim.config")
    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    for name, sign in pairs(Config.icons.dap) do
      sign = type(sign) == "table" and sign or { sign }
      vim.fn.sign_define(
        "Dap" .. name,
        { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
      )
    end
    require("dap.ext.vscode").load_launchjs(nil, { python = { "python" } })
  end,
}
