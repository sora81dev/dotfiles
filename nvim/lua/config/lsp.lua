local schemas = require("schemastore").yaml.schemas()

schemas["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] =
	{
		"k8s/*.yaml",
		"*.k8s.yaml",
	}

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)

		if client and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

-- ----------
-- ESLint
-- ----------
vim.lsp.config("eslint", {
	settings = {
		run = "onSave",
	},
})
vim.lsp.enable("eslint")

-- ----------
-- TypeScript
-- ----------
vim.lsp.config("ts_ls", {})
vim.lsp.enable("ts_ls")

-- ----------
-- C Language
-- ----------
vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--enable-config",
		"--background-index",
		"--clang-tidy",
	},
})
vim.lsp.enable("clangd")

-- ----------
-- Rust
-- ----------
vim.g.rustaceanvim = {
	server = {
		settings = {
			["rust-analyzer"] = {
				check = {
					allTargets = false,
				},
			},
		},
	},
}

-- ----------
-- Nix
-- ----------
vim.lsp.config("nil_ls", {})
vim.lsp.enable("nil_ls")

-- ----------
-- CSS
-- ----------
vim.lsp.config("cssls", {})
vim.lsp.enable("cssls")

--- ---------
--- TOML
--- ---------
vim.lsp.config("tombi", {})
vim.lsp.enable("tombi")

--- ---------
--- LaTeX
--- ---------
vim.lsp.config("texlab", {})
vim.lsp.enable("texlab")

--- ---------
--- YAML
--- ---------
vim.lsp.config("yamlls", {
	settings = {
		yaml = {
			--- k8s YAML JSON Schema
			schemaStore = {
				enable = false,
			},
			schemas = schemas,
		},
	},
})
vim.lsp.enable("yamlls")

--- ----------
--- TailwindCSS
--- ----------
vim.lsp.config("tailwindcss", {})
vim.lsp.enable("tailwindcss")

--- ----------
--- HTML
--- ----------
vim.lsp.config("html", {})
vim.lsp.enable("html")

--- ----------
--- Astro
--- ----------
-- vim.lsp.config("astro", {});
-- vim.lsp.enable("astro");

--- ----------
--- JSON
--- ----------
vim.lsp.config("jsonls", {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})
vim.lsp.enable("jsonls")

--- ----------
--- Svelte
--- ----------
vim.lsp.config("svelte", {})
vim.lsp.enable("svelte")

--- ----------
--- SQL
--- ----------
vim.lsp.config("sqls", {})
vim.lsp.enable("sqls")

--- ----------
--- Device Tree
--- ----------
local zephyr_base = vim.env.ZEPHYR_BASE
local project_root = "/home/sora81dev/Learn/Zephyr/0002_led-pwm"

vim.lsp.config("dts_lsp", {
	cmd = { "devicetree-language-server", "--stdio" },
	filetypes = { "dts", "dtsi", "overlay" },
	root_markers = { ".git" },
	settings = {
		devicetree = {
			cwd = project_root,
			defaultBindingType = "Zephyr",
			defaultIncludePaths = {
				zephyr_base .. "/dts",
				zephyr_base .. "/dts/arm",
				zephyr_base .. "/dts/arm64",
				zephyr_base .. "/dts/riscv",
				zephyr_base .. "/dts/common",
				zephyr_base .. "/dts/vendor",
				zephyr_base .. "/dts/include",
				zephyr_base .. "/dts/xtensa",
				zephyr_base .. "/include",
				zephyr_base .. "/include/zephyr",
				zephyr_base .. "/dts/arm",
				zephyr_base .. "/dts/arc",
				zephyr_base .. "/dts/posix",
				zephyr_base .. "/dts/sparc",
				zephyr_base .. "/dts/tricore",
				zephyr_base .. "/dts/rx",
				zephyr_base .. "/dts/x86",
			},
			defaultZephyrBindings = {
				zephyr_base .. "/dts/bindings",
			},
			autoChangeContext = true,
			allowAdhocContexts = true,
			contexts = {
				{
					ctxName = "nucleo_f767zi",
					cwd = project_root,
					bindingType = "Zephyr",
					dtsFile = zephyr_base .. "/boards/st/nucleo_f767zi/nucleo_f767zi.dts",
					overlays = {
						project_root .. "/app/boards/nucleo_f767zi.overlay",
					},
					includePaths = {
						zephyr_base .. "/dts",
						zephyr_base .. "/dts/arm",
						zephyr_base .. "/dts/arm64",
						zephyr_base .. "/dts/riscv",
						zephyr_base .. "/dts/common",
						zephyr_base .. "/dts/vendor",
						zephyr_base .. "/dts/include",
						zephyr_base .. "/dts/xtensa",
						zephyr_base .. "/include",
						zephyr_base .. "/include/zephyr",
						zephyr_base .. "/modules/hal/stm32/dts",
					},
					zephyrBindings = {
						zephyr_base .. "/dts/bindings",
					},
					compileCommands = project_root .. "/build/compile_commands.json",
				},
			},
			preferredContext = "nucleo_f767zi",
		},
	},
})

vim.lsp.enable("dts_lsp")

--- ----------
--- Go Lang
--- ----------
vim.lsp.config("gopls", {})
vim.lsp.enable("gopls")
