-- Auto-format
--
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>p',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  config = function()
    local conform = require 'conform'
    conform.setup {
      notify_on_error = false,
      -- log_level = vim.log.levels.DEBUG, -- Enable debug logging

      format_on_save = function(bufnr)
        -- Disable "fbrmat_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        -- local disable_filetypes = { c = true, cpp = true, javascript = true, javascriptreact = true, json = true }
        local disable_filetypes = { c = true, cpp = true, json = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,

      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- NOTE: Need to install eslint_d@13, latest version eslint@14 causing invalid JSON error
        javascript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
        javascriptreact = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
        -- json = { 'prettierd', 'prettier', stop_after_first = true },
      },
    }
  end,
}
