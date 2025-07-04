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
--
local f = require 'config.functions'

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufReadPre', {
  callback = function(args)
    -- Get the file size
    local stats = vim.loop.fs_stat(args.file)

    if stats and stats.size > 10 * 1024 * 1024 then -- file size greater than 1MB
      f.disable_for_large_files(args.buf)
    end
  end,
})
