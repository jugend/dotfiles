-- fzf-lua
--
return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  -- opts = {},
  config = function()
    require('fzf-lua').setup {
      files = {
        -- Shortens paths by replacing intermediate folders with single letters
        -- path_shorten = 8,
        formatter = 'path.filename_first',
      },
      keymap = {
        builtin = {
          -- neovim `:tmap` mappings for the fzf win
          -- uncomment to inherit all the below in your custom config
          -- ['<M-Esc>'] = 'hide', -- hide fzf-lua, `:FzfLua resume` to continue
          -- ['<F1>'] = 'toggle-help',
          ['<C-h>'] = 'toggle-help',
          -- ['<C-2>'] = 'toggle-fullscreen',
          ['<C-o>'] = 'toggle-fullscreen',
          -- Only valid with the 'builtin' previewer
          ['<C-w>'] = 'toggle-preview-wrap',
          -- ['<F4>'] = 'toggle-preview',
          ['<C-p>'] = 'toggle-preview',
          -- Rotate preview clockwise/counter-clockwise
          -- ['<F5>'] = 'toggle-preview-ccw',
          -- ['<F6>'] = 'toggle-preview-cw',
          -- `ts-ctx` binds require `nvim-treesitter-context`
          -- ['<F7>'] = 'toggle-preview-ts-ctx',
          -- ['<F8>'] = 'preview-ts-ctx-dec',
          -- ['<F9>'] = 'preview-ts-ctx-inc',
          -- ['<S-Left>'] = 'preview-reset',
          -- ['<S-down>'] = 'preview-page-down',
          ['<C-d>'] = 'preview-page-down',
          -- ['<S-up>'] = 'preview-page-up',
          ['<C-e>'] = 'preview-page-up',
          -- ['<S-up>'] = 'preview-page-up',
          -- ['<M-S-down>'] = 'preview-down',
          -- ['<M-S-up>'] = 'preview-up',
        },
      },
    }
    -- Use fzf-lua for list ui select
    require('fzf-lua').register_ui_select()
  end,
}
