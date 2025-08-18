return {
  'yetone/avante.nvim',
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = function()
    -- conditionally use the correct build system for the current OS
    if vim.fn.has 'win32' == 1 then
      return 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
    else
      return 'make'
    end
  end,
  event = 'VeryLazy',
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---
  -- Commenting off - causing required field warning if enabled
  -- @type avante.Config
  -- Require TAVILY key
  opts = {
    provider = 'claude',
    default_prompt = 'Act as senior software engineer, provide clear and thorough answer, but be concise.',
    providers = {
      claude = {
        -- When comment off will read from env variable ANTHROPIC_XXX
        endpoint = 'https://aiplatform.dev51.cbf.dev.paypalinc.com/cosmosai/llm/v1',
        -- endpoint = 'https://api.anthropic.com',
        -- model = 'claude-sonnet-4-20250514',
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
      moonshot = {
        endpoint = 'https://api.moonshot.ai/v1',
        model = 'kimi-k2-0711-preview',
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 32768,
        },
      },
    },
    mappings = {
      -- stop = '<C-c>', -- stop
      -- edit = '<leader>ue', -- edit
      -- refresh = '<leader>ur', -- refresh
    },
    hints = { enabled = true },
    behaviour = {
      -- auto_suggestions = true,
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    --- The below dependencies are optional,
    'echasnovski/mini.pick', -- for file_selector provider mini.pick
    'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
    'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
    'ibhagwan/fzf-lua', -- for file_selector provider fzf
    'stevearc/dressing.nvim', -- for input provider dressing
    'folke/snacks.nvim', -- for input provider snacks
    'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
    'zbirenbaum/copilot.lua', -- for providers='copilot'
    {
      -- support for image pasting
      'HakonHarnes/img-clip.nvim',
      event = 'VeryLazy',
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { 'markdown', 'Avante' },
      },
      ft = { 'markdown', 'Avante' },
    },
  },
  web_search_engine = {
    providers = {
      -- Disable Tavily default web_search_engine
      tavily = {
        disable_tools = true,
      },
    },
  },
  mappings = {
    suggestion = {
      accept = '<C-y>',
      next = '<C-]>',
      prev = '<C-[>',
      dismiss = '<C-x>',
    },
  },
}
