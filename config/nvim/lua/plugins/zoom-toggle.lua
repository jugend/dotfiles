-- local zoomed = false
-- local last_win_size = {}
--
function ZoomToggle()
  if zoomed then
    -- Restore previous window sizes
    for win, size in pairs(last_win_size) do
      vim.api.nvim_win_set_width(win, size.width)
      vim.api.nvim_win_set_height(win, size.height)
    end
    zoomed = false
  else
    -- Save current window sizes
    last_win_size = {}

    if #vim.api.nvim_tabpage_list_wins(0) < 1 then
      return
    end

    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
      last_win_size[win] = {
        width = vim.api.nvim_win_get_width(win),
        height = vim.api.nvim_win_get_height(win),
      }
    end
    -- Maximize current window
    vim.cmd 'wincmd |'
    vim.cmd 'wincmd _'
    zoomed = true
  end
end

-- local function ZoomToggle()
--   local win = vim.api.nvim_get_current_win()

--   -- Initialize table to store window state per tab
--   vim.t.zoomed = vim.t.zoomed or {}
--   vim.t.zoom_winrestcmd = vim.t.zoom_winrestcmd or {}

--   if vim.t.zoomed[win] then
--     -- Restore window layout
--     vim.cmd(vim.t.zoom_winrestcmd[win])
--     vim.t.zoomed[win] = false
--   else
--     -- Save current layout and maximize
--     vim.t.zoom_winrestcmd[win] = vim.fn.winrestcmd()
--     vim.cmd 'resize'
--     vim.cmd 'vertical resize'
--     vim.t.zoomed[win] = true
--   end
-- end

-- Optional keymap (e.g., <leader>z to toggle zoom)
vim.keymap.set('n', '<leader>z', ZoomToggle, { desc = 'Toggle Zoom Window' })

-- Map the function to a keybinding
vim.api.nvim_set_keymap('n', '<leader>z', ':lua ZoomToggle()<CR>', { noremap = true, silent = true })
