-- [[ Functions]]
--
local uv = vim.loop

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
      vim.notify('reload_files: ' .. directory .. name)
      dofile(directory .. '/' .. name)
    end
  end
end

local function reload_configs()
  dofile(vim.env.MYVIMRC) -- Reload the config

  local config_dir = vim.fn.stdpath 'config' .. '/lua/config'
  reload_files(config_dir) -- Reload the config

  vim.notify('reload_configs: Config reloaded!', vim.log.levels.INFO)
end

local function edit_in_command(command, back_nos)
  return function()
    local cmd_line = string.format(':lua %s', command)
    vim.api.nvim_feedkeys(cmd_line, 'n', true)
    vim.api.nvim_input(string.rep('<Left>', back_nos))
  end
end
