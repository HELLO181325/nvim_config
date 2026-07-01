local servers = {
	-- Lua
	["lua-language-server"] = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					-- path = vim.split(package.path, ";"),
				},
				diagnostics = {
					globals = { "vim" },
				},
				codeLens = {
					enable = true,
				},
				workspace = {
					checkThirdParty = false,
					library = { vim.env.VIMRUNTIME },
				},
				hint = {
					enable = true,
					setType = false,
					paramType = true,
					paramName = "Disable",
					semicolon = "Disable",
					arrayIndex = "Disable",
				},
			},
		},
	},
    ["clangd"] = {},
}

return servers
