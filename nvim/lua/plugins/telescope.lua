return {
	-- Telescope UI Select: Allows Telescope to use dropdown-style menus
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	-- Main Telescope Plugin
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required dependency for Telescope
			{
				"nvim-telescope/telescope-fzf-native.nvim", -- Fuzzy Finder for Telescope
				build = "make", -- Builds the native code on install/update
				cond = function() return vim.fn.executable("make") == 1 end, -- Loads if `make` is available
			},
		},
		config = function()
			-- Telescope Setup
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-d>"] = require("telescope.actions").delete_buffer, -- Delete buffer in insert mode
						},
						n = {
							["<C-d>"] = require("telescope.actions").delete_buffer, -- Delete buffer in normal mode
						},
					},
				},
				pickers = {
					buffers = {
						sort_lastused = true, -- Sort buffers by recent usage
						ignore_current_buffer = true, -- Exclude the current buffer from the list
						previewer = false, -- Disable preview for buffers picker
						theme = "dropdown", -- Use dropdown theme for simplicity
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			-- Load Telescope Extensions
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- Key Mappings for Telescope
			local builtin = require("telescope.builtin")

			local mappings = {
				{ "<leader>sh", builtin.help_tags, "[S]earch [H]elp" },
				{ "<leader>sk", builtin.keymaps, "[S]earch [K]eymaps" },
				{ "<leader>sf", builtin.find_files, "[S]earch [F]iles" },
				{ "<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope" },
				{ "<leader>sw", builtin.grep_string, "[S]earch current [W]ord" },
				{ "<leader>sg", builtin.live_grep, "[S]earch by [G]rep" },
				{ "<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics" },
				{ "<leader>sr", builtin.resume, "[S]earch [R]esume" },
				{ "<leader>s.", builtin.oldfiles, "[S]earch Recent Files" },
				{ "<leader><leader>", builtin.buffers, "[ ] Find existing buffers" },

			}

			-- Bind all mappings dynamically
			for _, map in ipairs(mappings) do
				vim.keymap.set("n", map[1], map[2], { desc = map[3] })
			end

			-- Search in current buffer with a dropdown theme
			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- Live Grep in Open Files
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			-- Shortcut for Neovim Configuration Files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}

