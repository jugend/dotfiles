-- Theme - One Dark
-- https://raw.githubusercontent.com/joshdick/onedark.vim/main/img/color_reference.png
-- List all the colors used in the theme in neo.nvim one dark plugin
return {
  'navarasu/onedark.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('onedark').setup {
      style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
      -- transparent = false, -- Show/hide background
      -- term_colors = true, -- Change terminal color as per the selected theme style
      -- ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
      -- cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
      --
      -- -- toggle theme style ---
      -- toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
      -- toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
      --
      -- -- Change code style ---
      -- -- Options are italic, bold, underline, none
      -- -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
      -- code_style = {
      --   comments = 'italic',
      --   keywords = 'none',
      --   functions = 'none',
      --   strings = 'none',
      --   variables = 'none',
      -- },
      --
      --   transparent = false, -- lualine center bar transparency
      -- },
      --
      -- -- Custom Highlights --
      -- https://github.com/navarasu/onedark.nvim/blob/67a74c275d1116d575ab25485d1bfa6b2a9c38a6/lua/onedark/highlights.lua#L165
      colors = {
        -- Background
        -- black = '#002833',
        bg0 = '#002833',
        -- Cursor line
        bg1 = '#002833',
        -- comment grey = '#657590',
        grey = '#646c7d',
        --- line grey
        line = '#2d474e',
      }, -- Override default colors
      highlights = {
        NvimTreeNormal = { bg = '$bg0' },
        NvimTreeNormalFloat = { bg = '$bg0' },
        NvimTreeVertSplit = { bg = '$bg0' },
        NvimTreeEndOfBuffer = { bg = '$bg0' },
        -- NvimTreeRootFolder = { fg = c.orange, fmt = "bold" },
        -- NvimTreeGitDirty = colors.Yellow,
        -- NvimTreeGitNew = colors.Green,
        -- NvimTreeGitDeleted = colors.Red,
        -- NvimTreeSpecialFile = { fg = c.yellow, fmt = "underline" },
        -- NvimTreeIndentMarker = colors.Fg,
        -- NvimTreeImageFile = { fg = c.dark_purple },
        -- NvimTreeSymlink = colors.Purple,
        -- NvimTreeFolderName = colors.Blue,

        NeoTreeNormal = { bg = '$bg0' },
        NeoTreeNormalNC = { bg = '$bg0' },
        NeoTreeVertSplit = { bg = '$bg0' },
        NeoTreeEndOfBuffer = { fg = '$bg0', bg = '$bg0' },
        NeoTreeWinSeparator = { fg = '$line' },
        -- NeoTreeEndOfBuffer = { fg = cfg.ending_tildes and c.bg2 or c.bg_d, bg = cfg.transparent and c.none or c.bg_d },
        -- NeoTreeRootName = { fg = c.orange, fmt = 'bold' },
        -- NeoTreeGitAdded = colors.Green,
        -- NeoTreeGitDeleted = colors.Red,
        -- NeoTreeGitModified = colors.Yellow,
        -- NeoTreeGitConflict = { fg = c.red, fmt = 'bold,italic' },
        -- NeoTreeGitUntracked = { fg = c.red, fmt = 'italic' },
        -- NeoTreeIndentMarker = colors.Grey,
        -- NeoTreeSymbolicLinkTarget = colors.Purple,

        -- DapUIBorder = { fg = '$line', },
      }, -- Override highlight groups
      --
      -- -- Plugins Config --
      diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true, -- use undercurl instead of underline for diagnostics
        background = true, -- use background color for virtual text
      },
    }

    vim.cmd.colorscheme 'onedark'

    -- Copilot color scheeme
    -- Green
    vim.cmd 'highlight CopilotSuggestion guifg=#98C379 ctermfg=8'
  end,
}
