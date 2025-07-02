-- [[ Harpoon ]]
--
return {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon.setup {
      -- global_settings = {
      --   -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      --   save_on_toggle = false,
      --
      --   -- saves the harpoon file upon every change. disabling is unrecommended.
      --   save_on_change = true,
      --
      --   -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      --   enter_on_sendcmd = false,
      --
      --   -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
      --   tmux_autoclose_windows = false,
      --
      --   -- filetypes that you want to prevent from adding to the harpoon list menu.
      --   excluded_filetypes = { 'harpoon' },
      --
      --   -- set marks specific to each git branch inside git repository
      --   mark_branch = false,
      --
      --   -- enable tabline with harpoon marks
      --   tabline = false,
      --   tabline_prefix = '   ',
      --   tabline_suffix = '   ',
      -- },
    }

    -- FZF-Lua Harpoon picker
    local function fzf_harpoon_files()
      local fzf = require 'fzf-lua'
      local harpoon_mark = require 'harpoon.mark'
      local entries = {}

      for idx = 1, harpoon_mark.get_length() do
        local file = harpoon_mark.get_marked_file_name(idx)
        if file == '' then
          file = '(empty)'
        end
        table.insert(entries, string.format('%s', file))
      end

      fzf.fzf_exec(entries, {
        prompt = 'Harpoon Files> ',
        actions = {
          ['default'] = function(selected)
            local file = selected[1]
            vim.cmd('edit ' .. file)
          end,
        },
      })
    end

    vim.keymap.set('n', '<leader>fa', fzf_harpoon_files, { desc = '[F]zf H[a]rpoon files' })
  end,
}
