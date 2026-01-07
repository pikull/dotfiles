return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			require("mason-lspconfig").setup({
				ensure_installed = {},
				handlers = {
					function(server)
						vim.lsp.config(server, { capabilities = capabilities })
						vim.lsp.enable(server)
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			"saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("LspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = ev.buf, noremap = true, silent = true }
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set({ "n", "v" }, "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set({ "n", "v" }, "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				end,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		 opts = {
			formatters_by_ft = {
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },

				lua = { "stylua" },
				python = { "isort", "black" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				sh = { "shfmt" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		},
		config = function(_, opts)
			local conform = require("conform")
			conform.setup(opts)
			vim.keymap.set("n", "<leader>gf", function()
				conform.format({ async = true })
			end, { silent = true })
		end,
	},
}
