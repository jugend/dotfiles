-- nvim-specter
-- Search and replace plugin
--
return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local spectre = require 'spectre'

    -- Specter Plugin
    vim.keymap.set('n', '<leader>R', '<cmd>lua require("spectre").toggle()<CR>', { desc = 'Toggle Spectre' })
    vim.keymap.set('n', '<leader>rr', require('spectre').open, { desc = 'Open Spectre (Search and Replace)' })
    vim.keymap.set('n', '<leader>rw', function()
      require('spectre').open_visual { select_word = true }
    end, { desc = 'Search current word' })
    vim.keymap.set('v', '<leader>rw', require('spectre').open_visual, { desc = 'Search selection' })
  end,
}
