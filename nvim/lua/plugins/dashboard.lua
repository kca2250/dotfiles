return {
  {
    "nvimdev/dashboard-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    config = function()
      -- ── Colors (onedark palette) ───────────────────────────
      vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#61afef" })
      vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#61afef" })
      vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#e5c07b", bold = true })
      vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#abb2bf" })
      vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#5c6370", italic = true })

      -- ── Gorilla header colors (gradient) ───────────────────
      vim.api.nvim_set_hl(0, "DashboardGorilla1", { fg = "#e06c75" })
      vim.api.nvim_set_hl(0, "DashboardGorilla2", { fg = "#e5c07b" })
      vim.api.nvim_set_hl(0, "DashboardGorilla3", { fg = "#98c379" })
      vim.api.nvim_set_hl(0, "DashboardGorilla4", { fg = "#56b6c2" })
      vim.api.nvim_set_hl(0, "DashboardGorilla5", { fg = "#61afef" })
      vim.api.nvim_set_hl(0, "DashboardGorilla6", { fg = "#c678dd" })

      -- ── Greeting (time-based) ──────────────────────────────
      local function greeting()
        local hour = tonumber(os.date("%H"))
        local msg
        if hour < 6 then
          msg = "  Night owl mode..."
        elseif hour < 12 then
          msg = "  Good morning!"
        elseif hour < 18 then
          msg = "  Good afternoon!"
        else
          msg = "  Good evening!"
        end
        local days = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
        local months = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
        local d = os.date("*t")
        return msg .. "  " .. days[d.wday] .. ", " .. months[d.month] .. " " .. d.day
      end

      local gorilla = {
        "",
        "",
        "██╗  ██╗ █████╗ ██╗██╗  ██╗ █████╗ ████████╗███████╗██╗   ██╗",
        "██║ ██╔╝██╔══██╗██║██║  ██║██╔══██╗╚══██╔══╝██╔════╝██║   ██║",
        "█████╔╝ ███████║██║███████║███████║   ██║   ███████╗██║   ██║",
        "██╔═██╗ ██╔══██║██║██╔══██║██╔══██║   ██║   ╚════██║██║   ██║",
        "██║  ██╗██║  ██║██║██║  ██║██║  ██║   ██║   ███████║╚██████╔╝",
        "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝",
        "",
        "███████╗██╗   ██╗██████╗ ██╗   ██╗██╗",
        "██╔════╝██║   ██║██╔══██╗██║   ██║██║",
        "███████╗██║   ██║██████╔╝██║   ██║██║",
        "╚════██║██║   ██║██╔══██╗██║   ██║╚═╝",
        "███████║╚██████╔╝██║  ██║╚██████╔╝██╗",
        "╚══════╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝",
        "",
        greeting(),
        "",
        "",
      }

      require("dashboard").setup({
        theme = "hyper",
        config = {
          header = gorilla,
          shortcut = {
            { desc = "  Recent Files", group = "DashboardDesc", action = "Telescope oldfiles", key = "r" },
            { desc = "  New File", group = "DashboardDesc", action = "enew", key = "n" },
            { desc = "  Config", group = "DashboardDesc", action = "edit $MYVIMRC", key = "c" },
            { desc = "  Plugins", group = "DashboardDesc", action = "lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('~/dotfiles/nvim/lua/plugins') })", key = "p" },
            { desc = "  Lazy", group = "DashboardDesc", action = "Lazy", key = "l" },
            { desc = "  Session", group = "DashboardDesc", action = "lua require('persistence').load()", key = "s" },
            { desc = "  Quit", group = "DashboardDesc", action = "qa", key = "q" },
          },
          project = {
            enable = true,
            limit = 8,
            action = function(path)
              require("telescope.builtin").find_files({ cwd = path })
            end,
          },
          footer = function()
            local stats = require("lazy").stats()
            return {
              "",
              "  " .. stats.loaded .. "/" .. stats.count .. " plugins  |    " .. string.format("%.0f", stats.startuptime) .. "ms",
            }
          end,
        },
      })

      -- ── Apply gradient colors to gorilla header ────────────
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dashboard",
        callback = function()
          local ns = vim.api.nvim_create_namespace("dashboard_gorilla")
          local colors = {
            "DashboardGorilla1",
            "DashboardGorilla2",
            "DashboardGorilla3",
            "DashboardGorilla4",
            "DashboardGorilla5",
            "DashboardGorilla6",
          }
          -- header art lines (0-indexed: 2-15)
          local start_line = 2
          local end_line = 15
          vim.schedule(function()
            local buf = vim.api.nvim_get_current_buf()
            local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
            for i = start_line, math.min(end_line, #lines - 1) do
              local color_idx = ((i - start_line) % #colors) + 1
              vim.api.nvim_buf_add_highlight(buf, ns, colors[color_idx], i, 0, -1)
            end
          end)
        end,
      })
    end,
  },
}
