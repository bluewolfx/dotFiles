return {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        -- leave empty for default dashboard, or customize here
        -- For example:
        -- header = {"Welcome to Neovim!"},
        -- buttons = {
        --   { key = "e", desc = "New File", action = "enew" },
        --   { key = "q", desc = "Quit", action = "q" },
        -- }
      }
    },
    -- Optional: if you want it to load on startup
    lazy = false,
    priority = 1000, -- High priority to load
}
