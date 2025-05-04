-- lualine.nvim
-- To format status line
--
return {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto', -- You can change this to your preferred theme
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
      },
    }
  end,
}
