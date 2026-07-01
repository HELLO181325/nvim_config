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
        local servers = require("lsp.servers")
        local formatters = require("lsp.formatters")
        local registry = require "mason-registry"

        -- 安装lsp包
        local function setup_lsp(name, config)
            -- 自动安装逻辑
            local success, package = pcall(registry.get_package, name)
            if success and not package:is_installed() then
                if package then
                    package:install()
                    vim.notify("正在安装LSP服务器: " .. name, vim.log.levels.INFO)
                else
                    vim.notify("未找到LSP服务器: " .. name, vim.log.levels.INFO)
                end
            end
            -- 获取lsp名称
            local nvim_lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]
            vim.lsp.config(nvim_lsp, config)
            vim.lsp.enable(nvim_lsp)
        end

        -- 安装格式化工具
        local function setup_formatter(name)
            local success, package = pcall(registry.get_package, name)
            if success and not package:is_installed() then
                package:install()
                vim.notify("正在安装格式化工具: " .. name, vim.log.levels.INFO)
            end
        end

        local function on_attach(client, bufnr)
            -- 打印信息用于调试，了解哪个 LSP 客户端连接了
			-- vim.notify("已连接 LSP 客户端: " .. client.name, vim.log.levels.INFO)
			-- 内联提示
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			-- 这里两个禁止lsp的格式化，只是用格式化工具提供的格式化，防止lsp与格式化的冲突
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
        end

        for name, config in pairs(servers) do
            local final_config = vim.tbl_deep_extend("force", config,{
                on_attach = on_attach,
            })

            setup_lsp(name, final_config)
        end

        for _, formatter in pairs(formatters.mason_formatters_list) do
            setup_formatter(formatter)
        end


        -- 错误提示方式
        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
            virtual_lines = false,

        })
    end,
}
