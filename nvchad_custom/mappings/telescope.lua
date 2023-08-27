local Util = require "custom.utils"

local M = {
  plugin = true,
  n = {
    ["<leader>,"] = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
    ["<leader>/"] = { Util.telescope "live_grep", "Grep (root dir)" },
    ["<leader>:"] = { "<cmd>Telescope command_history<cr>", "Command History" },
    ["<leader><space>"] = { Util.telescope "files", "Find Files (root dir)" },
    -- Find
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
    ["<leader>ff"] = { Util.telescope "files", "Find Files (root dir)" },
    ["<leader>fF"] = { Util.telescope("files", { cwd = false }), "Find Files (cwd)" },
    ["<leader>fr"] = { "<cmd>Telescope oldfiles<cr>", "Recent" },
    ["<leader>fR"] = { Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), "Recent (cwd)" },
    -- git
    ["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "commits" },
    ["<leader>gs"] = { "<cmd>Telescope git_status<CR>", "status" },
    -- search
    ['<leader>s"'] = { "<cmd>Telescope registers<cr>", "Registers" },
    ["<leader>sa"] = { "<cmd>Telescope autocommands<cr>", "Auto Commands" },
    ["<leader>sb"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
    ["<leader>sc"] = { "<cmd>Telescope command_history<cr>", "Command History" },
    ["<leader>sC"] = { "<cmd>Telescope commands<cr>", "Commands" },
    ["<leader>sd"] = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document diagnostics" },
    ["<leader>sD"] = { "<cmd>Telescope diagnostics<cr>", "Workspace diagnostics" },
    ["<leader>sg"] = { Util.telescope "live_grep", "Grep (root dir)" },
    ["<leader>sG"] = { Util.telescope("live_grep", { cwd = false }), "Grep (cwd)" },
    ["<leader>sh"] = { "<cmd>Telescope help_tags<cr>", "Help Pages" },
    ["<leader>sH"] = { "<cmd>Telescope highlights<cr>", "Search Highlight Groups" },
    ["<leader>sk"] = { "<cmd>Telescope keymaps<cr>", "Key Maps" },
    ["<leader>sM"] = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    ["<leader>sm"] = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
    ["<leader>so"] = { "<cmd>Telescope vim_options<cr>", "Options" },
    ["<leader>sR"] = { "<cmd>Telescope resume<cr>", "Resume" },
    ["<leader>sw"] = {
      Util.telescope("grep_string", { word_match = "-w" }),
      "Word (root dir)",
    },
    ["<leader>sW"] = {
      Util.telescope("grep_string", { cwd = false, word_match = "-w" }),
      "Word (cwd)",
    },
    ["<leader>ss"] = {
      Util.telescope("lsp_document_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      "Goto Symbol",
    },
    ["<leader>sS"] = {
      Util.telescope("lsp_dynamic_workspace_symbols", {
        symbols = {
          "Class",
          "Function",
          "Method",
          "Constructor",
          "Interface",
          "Module",
          "Struct",
          "Trait",
          "Field",
          "Property",
        },
      }),
      "Goto Symbol (Workspace)",
    },
  },
  v = {
    ["<leader>sw"] = {
      Util.telescope("grep_string", { mode = "v" }),
      "Selection (root dir)",
    },
    ["<leader>sW"] = {
      Util.telescope("grep_string", { cwd = false }),
      "Selection (cwd)",
    },
  },
}
return M
