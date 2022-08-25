--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

	-- Configure AstroNvim updates
	updater = {
		remote = "origin", -- remote to use
		channel = "nightly", -- "stable" or "nightly"
		version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
		branch = "main", -- branch name (NIGHTLY ONLY)
		commit = nil, -- commit hash (NIGHTLY ONLY)
		pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
		skip_prompts = false, -- skip prompts about breaking changes
		show_changelog = true, -- show the changelog after performing an update
		auto_reload = false, -- automatically reload and sync packer after a successful update
		auto_quit = false, -- automatically quit the current session after a successful update
		-- remotes = { -- easily add new remotes to track
		--   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
		--   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
		--   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
		-- },
	},

	-- Set colorscheme to use
	colorscheme = "onenord",

	-- Override highlight groups in any theme
	highlights = {
		-- duskfox = { -- a table of overrides/changes to the default
		--   Normal = { bg = "#000000" },
		-- },
		default_theme = function(highlights) -- or a function that returns a new table of colors to set
			local C = require("default_theme.colors")

			highlights.Normal = { fg = C.fg, bg = C.bg }
			return highlights
		end,
	},

	-- set vim options here (vim.<first_key>.<second_key> =  value)
	options = {
		opt = {
			relativenumber = false, -- sets vim.opt.relativenumber
		},
		g = {
			mapleader = " ", -- sets vim.g.mapleader
		},
	},
	-- If you need more control, you can use the function()...end notation
	-- options = function(local_vim)
	--   local_vim.opt.relativenumber = true
	--   local_vim.g.mapleader = " "
	--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
	--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
	--
	--   return local_vim
	-- end,

	-- Set dashboard header
	header = {
		" █████  ███████ ████████ ██████   ██████",
		"██   ██ ██         ██    ██   ██ ██    ██",
		"███████ ███████    ██    ██████  ██    ██",
		"██   ██      ██    ██    ██   ██ ██    ██",
		"██   ██ ███████    ██    ██   ██  ██████",
		" ",
		"    ███    ██ ██    ██ ██ ███    ███",
		"    ████   ██ ██    ██ ██ ████  ████",
		"    ██ ██  ██ ██    ██ ██ ██ ████ ██",
		"    ██  ██ ██  ██  ██  ██ ██  ██  ██",
		"    ██   ████   ████   ██ ██      ██",
	},

	-- Default theme configuration
	default_theme = {
		-- set the highlight style for diagnostic messages
		diagnostics_style = { italic = true },
		-- Modify the color palette for the default theme
		colors = {
			fg = "#abb2bf",
			bg = "#1e222a",
		},
		-- enable or disable highlighting for extra plugins
		plugins = {
			aerial = true,
			beacon = false,
			bufferline = true,
			dashboard = true,
			highlighturl = true,
			hop = false,
			indent_blankline = true,
			lightspeed = false,
			["neo-tree"] = true,
			notify = true,
			["nvim-tree"] = false,
			["nvim-web-devicons"] = true,
			rainbow = true,
			symbols_outline = false,
			telescope = true,
			vimwiki = false,
			["which-key"] = true,
		},
	},

	-- Diagnostics configuration (for vim.diagnostics.config({...}))
	diagnostics = {
		virtual_text = false,
		underline = true,
	},

	-- Extend LSP configuration
	lsp = {
		-- enable servers that you already have installed without mason
		servers = {
			-- "pyright"
		},
		-- easily add or disable built in mappings added during LSP attaching
		mappings = {
			n = {
				-- ["<leader>lf"] = false -- disable formatting keymap
			},
		},
		-- add to the global LSP on_attach function
		-- on_attach = function(client, bufnr)
		-- end,

		-- override the mason server-registration function
		-- server_registration = function(server, opts)
		--   require("lspconfig")[server].setup(opts)
		-- end,

		-- Add overrides for LSP server settings, the keys are the name of the server
		["server-settings"] = {
			-- example for addings schemas to yamlls
			-- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
			--   settings = {
			--     yaml = {
			--       schemas = {
			--         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
			--         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
			--         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
			--       },
			--     },
			--   },
			-- },
			-- Example disabling formatting for a specific language server
			-- gopls = { -- override table for require("lspconfig").gopls.setup({...})
			--   on_attach = function(client, bufnr)
			--     client.resolved_capabilities.document_formatting = false
			--   end
			-- }
		},
	},

	-- Mapping data with "desc" stored directly by vim.keymap.set().
	--
	-- Please use this mappings table to set keyboard mapping since this is the
	-- lower level configuration and more robust one. (which-key will
	-- automatically pick-up stored data by this setting.)
	mappings = {
		-- first key is the mode
		l = {
			["<leader>f"] = { "<cmd>Format<cr>", desc = "Format code" },
		},
		n = {
			-- second key is the lefthand side of the map
			-- mappings seen under group name "Buffer"
			["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
			["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
			["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
			["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
			-- quick save
			-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
		},
		t = {
			-- setting a mapping to false will disable it
			-- ["<esc>"] = false,
		},
	},

	-- Configure plugins
	plugins = {
		init = {
			-- You can disable default plugins as follows:
			-- ["goolord/alpha-nvim"] = { disable = true },

			-- You can also add new plugins here as well:
			-- Add plugins, the packer syntax without the "use"
			-- { "andweeb/presence.nvim" },
			-- {
			--   "ray-x/lsp_signature.nvim",
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },

			-- We also support a key value style plugin definition similar to NvChad:
			-- ["ray-x/lsp_signature.nvim"] = {
			--   event = "BufRead",
			--   config = function()
			--     require("lsp_signature").setup()
			--   end,
			-- },
			{
				"rmehri01/onenord.nvim",
				as = "onenord",
				config = function()
					require("onenord").setup({
						theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
						borders = true, -- Split window borders
						fade_nc = false, -- Fade non-current windows, making them more distinguishable
						-- Style that is applied to various groups: see `highlight-args` for options
						styles = {
							comments = "italic",
							strings = "NONE",
							keywords = "NONE",
							functions = "NONE",
							variables = "NONE",
							diagnostics = "underline",
						},
						disable = {
							background = false, -- Disable setting the background color
							cursorline = false, -- Disable the cursorline
							eob_lines = true, -- Hide the end-of-buffer lines
						},
						-- Inverse highlight for different groups
						inverse = {
							match_paren = false,
						},
						custom_highlights = {}, -- Overwrite default highlight groups
						custom_colors = {}, -- Overwrite default colors
					})
				end,
			},
			{
				"mhartington/formatter.nvim",
				as = "formatter",
				config = function()
					require("formatter").setup({
						logging = true,
						log_level = vim.log.levels.WARN,
						filetype = {
							ruby = {
								require("formatter.filetypes.ruby").rubocop,

								function()
									return {
										exe = "rubocop",
										args = {
											"-A",
										},
									}
								end,
							},
						},
					})
				end,
			},
			{
				"rmagatti/goto-preview",
				as = "goto-preview",
				config = function()
					local gtp = require("goto-preview")
					local select_to_edit_map = {
						default = "edit",
						horizontal = "new",
						vertical = "vnew",
						tab = "tabedit",
					}

					local function open_file(orig_window, filename, cursor_position, command)
						if orig_window ~= 0 and orig_window ~= nil then
							vim.api.nvim_set_current_win(orig_window)
						end
						pcall(vim.cmd, string.format("%s %s", command, filename))
						vim.api.nvim_win_set_cursor(0, cursor_position)
					end

					local function open_preview(preview_win, type)
						return function()
							local command = select_to_edit_map[type]
							local orig_window = vim.api.nvim_win_get_config(preview_win).win
							local cursor_position = vim.api.nvim_win_get_cursor(preview_win)
							local filename = vim.api.nvim_buf_get_name(0)

							vim.api.nvim_win_close(preview_win, gtp.conf.force_close)
							open_file(orig_window, filename, cursor_position, command)

							local buffer = vim.api.nvim_get_current_buf()
							vim.api.nvim_buf_del_keymap(buffer, "n", "<C-v>")
							vim.api.nvim_buf_del_keymap(buffer, "n", "<CR>")
							vim.api.nvim_buf_del_keymap(buffer, "n", "<C-x>")
							vim.api.nvim_buf_del_keymap(buffer, "n", "<C-t>")
						end
					end

					local function post_open_hook(buf, win)
						vim.keymap.set("n", "<C-v>", open_preview(win, "vertical"), { buffer = buf })
						vim.keymap.set("n", "<CR>", open_preview(win, "default"), { buffer = buf })
						vim.keymap.set("n", "<C-x>", open_preview(win, "horizontal"), { buffer = buf })
						vim.keymap.set("n", "<C-t>", open_preview(win, "tab"), { buffer = buf })
					end

					require("goto-preview").setup({
						default_mappings = true,
  					post_open_hook = post_open_hook,
					})
				end,
			},
		},
		-- All other entries override the require("<key>").setup({...}) call for default plugins
		["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
			-- config variable is the default configuration table for the setup functino call
			local null_ls = require("null-ls")
			-- Check supported formatters and linters
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
			-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
			config.sources = {
				-- Set a formatter
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
			}
			return config -- return final config table to use in require("null-ls").setup(config)
		end,
		treesitter = { -- overrides `require("treesitter").setup(...)`
			ensure_installed = { "lua" },
		},
		-- use mason-lspconfig to configure LSP installations
		["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
			ensure_installed = { "sumneko_lua" },
		},
		-- use mason-tool-installer to configure DAP/Formatters/Linter installation
		["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
			ensure_installed = { "prettier", "stylua", "rubocop" },
		},
		packer = { -- overrides `require("packer").setup(...)`
			compile_path = vim.fn.stdpath("data") .. "/packer_compiled.lua",
		},
	},

	-- LuaSnip Options
	luasnip = {
		-- Add paths for including more VS Code style snippets in luasnip
		vscode_snippet_paths = {},
		-- Extend filetypes
		filetype_extend = {
			javascript = { "javascriptreact" },
		},
	},

	-- CMP Source Priorities
	-- modify here the priorities of default cmp sources
	-- higher value == higher priority
	-- The value can also be set to a boolean for disabling default sources:
	-- false == disabled
	-- true == 1000
	cmp = {
		source_priority = {
			nvim_lsp = 1000,
			luasnip = 750,
			buffer = 500,
			path = 250,
		},
	},

	-- Modify which-key registration (Use this with mappings table in the above.)
	["which-key"] = {
		-- Add bindings which show up as group name
		register_mappings = {
			-- first key is the mode, n == normal mode
			n = {
				-- second key is the prefix, <leader> prefixes
				["<leader>"] = {
					-- third key is the key to bring up next level and its displayed
					-- group name in which-key top level menu
					["b"] = { name = "Buffer" },
				},
			},
		},
	},

	-- This function is run last and is a good place to configuring
	-- augroups/autocommands and custom filetypes also this just pure lua so
	-- anything that doesn't fit in the normal config locations above can go here
	polish = function()
		-- Set key binding
		-- Set autocommands
		vim.api.nvim_create_augroup("packer_conf", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Sync packer after modifying plugins.lua",
			group = "packer_conf",
			pattern = "plugins.lua",
			command = "source <afile> | PackerSync",
		})

		vim.api.nvim_create_augroup("formatter_nvim", { clear = true })
		vim.api.nvim_create_autocmd("BufWritePost", {
			desc = "Format file after save",
			group = "formatter_nvim",
			pattern = "*.rb",
			command = "FormatWrite",
		})

		-- vim.keymap.set("n", "<leader>lf", "<cmd>Format<cr>", "Format code")

		-- Set up custom filetypes
		-- vim.filetype.add {
		--   extension = {
		--     foo = "fooscript",
		--   },
		--   filename = {
		--     ["Foofile"] = "fooscript",
		--   },
		--   pattern = {
		--     ["~/%.config/foo/.*"] = "fooscript",
		--   },
		-- }
	end,
}

return config
