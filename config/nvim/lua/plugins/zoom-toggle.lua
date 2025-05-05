local zoomed = false
local last_win_size = {}
local M = {}

function M.setup()
  vim.api.nvim_create_user_command(
    'ZoomToggle', -- Command name
    function(opts)
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
    end,
    { nargs = '?' } -- Command options (e.g., nargs specifies the number of arguments)
  )
end

return M
