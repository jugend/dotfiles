return {
  'mileszs/ack.vim',
  cmd = { 'Ack', 'AckAdd' }, -- Lazy-load on these commands
  init = function()
    -- Set ack as the search tool with preferred flags
    -- vim.g.ackprg = 'ack --nogroup --nocolor --column'
    vim.g.ackprg = 'rg --vimgrep --smart-case'
  end,
  keys = {
    { '<leader>a', ':Ack ', desc = 'Search with ack' },
  },
}
