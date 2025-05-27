-- [[ Functions]]
--
local M = {}
local uv = vim.loop

M.SEVERITY_CONFIG = { min = vim.diagnostic.severity.INFO }

local function reload_files(directory)
  local handle = uv.fs_scandir(directory)
  if not handle then
    vim.nofiy('reload_files: Failed to open directory - ' .. directory)
    return
  end

  while true do
    local name, type = uv.fs_scandir_next(handle)
    if not name then
      break
    end
    if type == 'file' then
      vim.notify('reload_files: ' .. directory .. '/' .. name)
      dofile(directory .. '/' .. name)
    end
  end
end

function M.reload_configs()
  dofile(vim.env.MYVIMRC) -- Reload the config

  local config_dir = vim.fn.stdpath 'config' .. '/lua/config'
  reload_files(config_dir) -- Reload the config

  vim.notify('reload_configs: Config reloaded!', vim.log.levels.INFO)
end

function M.edit_in_command(command, back_nos)
  return function()
    local cmd_line = string.format(':lua %s', command)
    vim.api.nvim_feedkeys(cmd_line, 'n', true)
    vim.api.nvim_input(string.rep('<Left>', back_nos))
  end
end

function M.is_loclist_open()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.fn.getwininfo(win)[1].loclist == 1 then
      return true
    end
  end
  return false
end

function M.has_diagnostic_error()
  local diagnostics = vim.diagnostic.get(0) -- Get diagnostics for the current buffer
  for _, diagnostic in ipairs(diagnostics) do
    if diagnostic.severity == vim.diagnostic.severity.ERROR or diagnostic.severity == vim.diagnostic.severity.WARN then
      return true
    end
  end
  return false
end

function M.toggle_diagnostic_loclist()
  if M.is_loclist_open() then
    vim.cmd ':lclose'
  else
    vim.diagnostic.setloclist {
      severity = M.SEVERITY_CONFIG,
    }
  end
end

function M.disable_for_large_files(bufnr)
  local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(bufnr))
  if stats and stats.size > 1024 * 1024 then -- >1MB
    vim.b[bufnr].large_file = true

    vim.cmd 'syntax off'
    vim.opt_local.swapfile = false
    vim.opt_local.undofile = false
    -- vim.opt_local.foldmethod = 'manual'
    vim.opt_local.signcolumn = 'no'
    -- vim.opt_local.number = false
    vim.opt_local.relativenumber = false

    -- Treesitter
    vim.cmd 'TSBufDisable highlight'

    -- LSP + Diagnostics, or 0
    vim.diagnostic.enable(false, { bufnr = bufnr })
    for _, client in pairs(vim.lsp.get_clients { bufnr = bufnr }) do
      client.stop(bufnr)
    end

    -- Copilot
    vim.cmd 'Copilot disable'
    --
    -- -- CMP, causing error, unable to load file
    -- local cmp = require 'cmp'
    -- if cmp then
    --   cmp.setup.buffer { enabled = false }
    -- end

    -- Gitsigns
    pcall(require('gitsigns').detach, bufnr)

    -- Conform formatting
    vim.b[bufnr].conform_disable = true

    -- Autopairs (optional)
    vim.b[bufnr].autopairs_disabled = true
  end
end

return M
