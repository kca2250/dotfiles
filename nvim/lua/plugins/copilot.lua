return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	cmd = { "Copilot", "CopilotPanel" },
	requires = { "copilotlsp-nvim/copilot-lsp" }, -- optional
	config = function()
		local ok, copilot = pcall(require, "copilot")
		if not ok then
			vim.notify("copilot.lua not available", vim.log.levels.WARN)
			return
		end

		copilot.setup({
			panel = {
				enabled = true,
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = { position = "bottom", ratio = 0.4 },
			},
			suggestion = {
				enabled = false,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = "<M-l>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			copilot_node_command = "node",
		})

		local function feed_key(key)
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, false, true), "n", false)
		end

		local function luasnip_available()
			local ok, luasnip = pcall(require, "luasnip")
			if not ok then
				return false
			end
			return luasnip
		end

		-- Keymaps: accept Copilot suggestions
		-- <Tab> accepts suggestion when visible; otherwise falls back to cmp, luasnip, or inserts a tab
		local function copilot_accept_tab()
			local ok, suggestion = pcall(require, "copilot.suggestion")
			if ok and suggestion.is_visible() then
				suggestion.accept()
				return
			end

			local ok_cmp, cmp = pcall(require, "cmp")
			if ok_cmp and cmp.visible() then
				cmp.select_next_item()
				return
			end

			local luasnip = luasnip_available()
			if luasnip then
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
					return
				end
			end

			-- fallback: insert a tab character
			feed_key("<Tab>")
		end

		vim.keymap.set("i", "<Tab>", copilot_accept_tab, { silent = true })
		vim.keymap.set("s", "<Tab>", copilot_accept_tab, { silent = true })

		-- Shift-Tab: go to previous cmp item, jump back in luasnip, or copilot prev suggestion if visible
		local function copilot_s_tab()
			local ok, suggestion = pcall(require, "copilot.suggestion")
			if ok and suggestion.is_visible() then
				suggestion.prev()
				return
			end
			local ok_cmp, cmp = pcall(require, "cmp")
			if ok_cmp and cmp.visible() then
				cmp.select_prev_item()
				return
			end

			local luasnip = luasnip_available()
			if luasnip then
				if luasnip.jumpable(-1) then
					luasnip.jump(-1)
					return
				end
			end

			feed_key("<S-Tab>")
		end

		vim.keymap.set("i", "<S-Tab>", copilot_s_tab, { silent = true })
		vim.keymap.set("s", "<S-Tab>", copilot_s_tab, { silent = true })

		-- Keep the existing <M-l> accept mapping as alternative
		vim.keymap.set("i", "<M-l>", function()
			local ok2, suggestion = pcall(require, "copilot.suggestion")
			if ok2 and suggestion.is_visible() then
				suggestion.accept()
			else
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<M-l>", true, false, true), "n", false)
			end
		end, { silent = true })

		-- nvim-cmp integration: hide copilot inline suggestions when cmp menu is open
		local ok_cmp, cmp = pcall(require, "cmp")
		if ok_cmp and cmp.event and cmp.event.on then
			cmp.event:on("menu_opened", function()
				vim.b.copilot_suggestion_hidden = true
			end)
			cmp.event:on("menu_closed", function()
				vim.b.copilot_suggestion_hidden = false
			end)
		end

		-- Optional: a small command to toggle copilot suggestion auto trigger
		vim.api.nvim_create_user_command("CopilotToggleAuto", function()
			local ok3, suggestion = pcall(require, "copilot.suggestion")
			if not ok3 then
				vim.notify("copilot.suggestion not available", vim.log.levels.WARN)
				return
			end
			suggestion.toggle_auto_trigger()
			vim.notify("Toggled Copilot auto trigger")
		end, {})

		-- Ensure highlight groups exist (safe defaults)
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(0, "CopilotSuggestion", { link = "Comment" })
				vim.api.nvim_set_hl(0, "CopilotAnnotation", { link = "Comment" })
			end,
		})
	end,
}
