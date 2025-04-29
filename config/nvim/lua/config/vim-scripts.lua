-- Switch node version to the latest version, min node 20 and above for Copilot support
-- Doesn't towrk
-- if vim.fn.executable 'nvm' == 1 then
--   local node_version = 'stable' -- Replace with your desired Node.js version
--   os.execute('nvm use ' .. node_version)
-- end

-- Highlight when yanking (copying) text
--  See `:help lua-guide-autocommands`
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
