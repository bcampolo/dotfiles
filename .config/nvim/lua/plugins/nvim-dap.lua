-- Debugging Support
return {
  "rcarriga/nvim-dap-ui",
  event = 'VeryLazy',
  dependencies = {
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text", -- inline variable text while debugging
    "nvim-telescope/telescope-dap.nvim", -- telescope integration with dap
    "mfussenegger/nvim-jdtls", -- Java LSP support
  },
  opts = {
    controls = {
      element = "repl",
      enabled = false,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = { {
      elements = { {
        id = "scopes",
        size = 0.5
      }, {
          id = "stacks",
          size = 0.34
        }, {
          id = "watches",
          size = 0.15
        }, {
          id = "breakpoints",
          size = 0.01
        } },
      position = "left",
      size = 50
    }, {
        elements = { {
          id = "console",
          size = 0.75
        }, {
            id = "repl",
            size = 0.25
          } },
        position = "bottom",
        size = 10
      } },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
  },
  config = function (_, opts)
    local dap = require('dap')
    require('dapui').setup(opts)

    dap.listeners.after.event_initialized["dapui_config"] = function()
      require('dapui').open()
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
      require('dapui').close()
    end

    dap.listeners.before.event_exited["dapui_config"] = function()
      require('dapui').close()
    end

    dap.configurations.java = {
      {
        name = "Starship Empire Server",
        type = "java",
        request = "launch",
        -- You need to extend the classPath to list your dependencies.
        -- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
        -- classPaths = {},

        -- If using multi-module projects, remove otherwise.
        -- projectName = "yourProjectName",

        -- javaExec = "java",
        mainClass = "com.starshipempire.server.StarshipEmpireServer",

        -- If using the JDK9+ module system, this needs to be extended
        -- `nvim-jdtls` would automatically populate this property
        -- modulePaths = {},
        vmArgs = "" ..
          "-Xmx2g " ..
          "-Dstarshipempire.db.path=/home/bcampolo/git/starshipempire/server/src/main/resources/database/server.db " ..
          "-Dstarshipempire.mode.demo=False " ..
          "-Dstarshipempire.steam.api.url=https://partner.steam-api.com " ..
          "-Dstarshipempire.steam.api.microtxn.endpoint=ISteamMicroTxnSandbox " ..
          "-Dstarshipempire.steam.api.key=FA9A9256EEA6C8AB70C125A3449C0925 " ..
          "-Dstarshipempire.steam.api.appid=1882170 " ..
          "-Dstarshipempire.port=8080 " ..
          "-Dstarshipempire.shared.path=/home/bcampolo/git/starshipempire/shared "
      },
      {
        name = "Debug Attach (8001)";
        type = 'java';
        request = 'attach';
        hostName = "127.0.0.1";
        port = 8001;
      },
      {
        name = "Debug (12GB)";
        type = 'java';
        request = 'launch';
        vmArgs = "" ..
          "-Xmx12g "
      },
    }
  end
}

