return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-vitest",
      "fredrikaverpil/neotest-golang",
    },
    keys = {
      { "<leader>tr", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output_panel.toggle() end, desc = "Toggle output panel" },
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest"),
          require("neotest-golang"),
        },
      })
    end,
  },
}
