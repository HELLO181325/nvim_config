return {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "neovim/nvim-lspconfig",  -- 为lsp提供默认配置
        "mason-org/mason-lspconfig.nvim",
    },
    opts = {},
    config = function(_, opts)
        require("mason").setup(opts)
        local registry = require "mason-registry"

        local function setup(name, config)
            -- 自动安装逻辑
            local success, package = pcall(registry.get_package, name)
            if success and not package:is_installed() then
                package:install()
            end
            -- 获取lsp名称
            local nvim_lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]
            vim.lsp.config(nvim_lsp, config)
            vim.lsp.enable(nvim_lsp)
        end

        setup("lua-language-server", {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        })

        -- 错误提示方式
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
            virtual_lines = false,

        })
    end,
}
