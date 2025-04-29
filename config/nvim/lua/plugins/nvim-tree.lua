-- Nvim Tree - File Explorer
-- Shortcut keys g? => Show help
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for nice file icons
  },
  config = function()
    require('nvim-tree').setup {
      -- your nvim-tree config goes here
      -- for example:
      view = {
        width = 30,
        side = 'left',
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
    }
  end,
}
