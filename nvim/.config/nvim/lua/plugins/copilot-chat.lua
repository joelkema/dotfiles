return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = true, -- Enable debugging
      model = "claude-sonnet-4-5",

      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
}
