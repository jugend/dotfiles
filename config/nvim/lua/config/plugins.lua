-- [[ Install `lazy.nvim` plugin manager ]]
--
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
--
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.

  -- TMUX Navigator

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `opts` key (recommended), the configuration runs
  -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

  require 'plugins.vim-tmux-navigator',
  -- Theme
  require 'plugins.theme-onedark',
  -- Search
  -- require 'plugins.telescope',
  require 'plugins.fzf-lua',
  require 'plugins.which-key',
  -- LSP Plugins
  -- Auto-complete
  require 'plugins.lazydev',
  require 'plugins.nvim-lspconfig',
  require 'plugins.blink-cmp',
  -- Validation
  require 'plugins.conform',
  -- Notes
  require 'plugins.todo-comments',
  require 'plugins.mini',
  -- Navigation
  require 'plugins.nvim-tree',
  -- require 'plugins.neo-tree',
  -- Formatting
  require 'plugins.nvim-treesitter',
  -- Co-pilot
  require 'plugins.copilot',
  require 'plugins.copilot-chat',
  require 'plugins.blink-cmp-copilot',
  -- Validation
  -- require 'plugins.nvim-lint',
  --
  -- Utils
  require 'plugins.nvim-surround',
  -- require 'plugins.indent_line',
  require 'plugins.autopairs',
  require 'plugins.gitsigns', -- adds gitsigns recommend keymaps
  require 'plugins.nvim-specter',
  require 'plugins.lazygit-nvim',
  -- require 'plugins.trouble-nvim',
  -- Debugger
  require 'plugins.nvim-dap',

  -- TODO: to take look laster on, has errors
  -- require 'plugins.zoom-toggle', -- adds gitsigns recommend keymaps

  -- Dev
  -- Will override ,b, C-i and probably a few other keymaps
  -- require 'plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keyb = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
