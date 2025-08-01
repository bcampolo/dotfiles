return {
  "ravitemer/mcphub.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  build = "npm install -g mcp-hub@latest",
  opts = {
    extensions = {
      avante = {
        make_slash_commands = true,
      }
    },
  },
  config = function(_, opts)
    require("mcphub").setup(opts)
  end
}
