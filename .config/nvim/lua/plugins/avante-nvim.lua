-- LLM Code Helper
return {
  -- https://github.com/yetone/avante.nvim
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  opts = {
    provider = "openai",
    providers = {
      openai = {
        model = "gpt-4o-mini",
        -- model = "gpt-4.1",
        api_key_name = "cmd:secret-tool lookup openai neovim",
        -- context_window = 128000,
        context_window = 30000,
        extra_request_body = {
          temperature = 0.75,
          -- max_completion_tokens = 16384, -- Increase this to include reasoning tokens (for reasoning models)
          max_completion_tokens = 10000,
          reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
        },
      },
    },
    -- MCP support
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
    end,
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
    disabled_tools = { "web_search" },
    windows = {
      position = "right",
      wrap = true,
      width = 30,
      sidebar_header = {
        enabled = true,
        align = "center",
        rounded = false,
      },
      spinner = {
        editing = { "⡀", "⠄", "⠂", "⠁", "⠈", "⠐", "⠠", "⢀", "⣀", "⢄", "⢂", "⢁", "⢈", "⢐", "⢠", "⣠", "⢤", "⢢", "⢡", "⢨", "⢰", "⣰", "⢴", "⢲", "⢱", "⢸", "⣸", "⢼", "⢺", "⢹", "⣹", "⢽", "⢻", "⣻", "⢿", "⣿" },
        generating = { "·", "✢", "✳", "∗", "✻", "✽" },
        thinking = { "🤯", "🙄" },
      },
      input = {
        prefix = "> ",
        height = 12,
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
  },
}
