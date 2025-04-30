--[[ Nvim Init Configs ]]
--[[
  NOTE: Checkout the following docs to get started:

    Checkout Lua
    - https:// learnxinyminutes.com/docs/lua/
    - :help lua-guide
    - (or HTML version): https:// neovim.io/doc/user/lua-guide.html

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    Run AND READ `:help`.
      - "<space>sh" to [s]earch the [h]elp documentation,
        which is very useful when you're not exactly sure of what you're looking for.
      - `:help X` comments throughout the init.lua
        These are hints about where to find more information about the relevant settings,
        plugins or Neovim features used in Kickstart.

    Run `:checkhealth` if there is any issue with the installation.
--]]

local function r(module)
  local status_ok, loaded_module = pcall(require, module)
  if not status_ok then
    vim.notify('Error loading ' .. module, vim.log.levels.ERROR)
    vim.notify(loaded_module, vim.log.levels.ERROR)
  end
  return loaded_module
end

r 'config.functions'
r 'config.vim-scripts'
r 'config.vim-options'
r 'config.vim-keymaps'
r 'config.plugins'
