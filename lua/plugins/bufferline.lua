return {
    "akinsho/bufferline.nvim",
    opts = {
        options = {
            always_show_bufferline = true,

            -- 配合侧边栏
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "📂 Files",
                    highlight = "Directory",
                    text_align = "left",
                },
            },

            -- 显示 LSP 诊断信息，可选 "nvim_lsp", "coc", "default"
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function (_, _, diagnostics_dict, _) -- 自定义图标和颜色
                local indicator = " "
                for level, number in pairs(diagnostics_dict) do
                    local symbol
                    if level == "error" then
                        symbol = " "
                    elseif level == "warning" then
                        symbol = " "
                    else
                        symbol = " "
                    end
                    indicator = indicator .. number .. symbol
                end
                return indicator
            end
        }
    },

    -- 快捷键设置
    keys = {
        { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },
        { "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },
        { "<leader>bd", ":bdelete<CR>", silent = true },
        { "<leader>bo", ":BufferLineCloseOthers<CR>", silent = true },
        { "<leader>bp", ":BufferLinePick<CR>", silent = true },
        { "<leader>bc", ":BufferLinePickClose<CR>", silent = true },
    },
    lazy = false,
}
