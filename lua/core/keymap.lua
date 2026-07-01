vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- ------------ 插入模式 ------------- --
keymap.set("i", "jk", "<ESC>")

-- ------------ 视觉模式 ------------- --
-- 单行或多行移动
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- ------------ 正常模式 ------------- --
-- 窗口
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- 取消高亮
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- ------------ 诊断相关 ------------- --
keymap.set("n", "K", function()
    -- 自定义 Hover 浮窗样式
    vim.lsp.buf.hover({ border = "rounded" })
end, { desc = "LSP: 显示文档/Hover" })

keymap.set("n", "<C-k>", function()
    vim.lsp.buf.signature_help({ border = "rounded" })
end, { desc = "LSP: 签名帮助" })

keymap.set("n", "<leader>D", vim.diagnostic.open_float, { desc = "LSP: 打开诊断浮窗" })
keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = "LSP: 上一个错误" })
keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = "LSP: 下一个错误" })
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: 代码操作 (Code Action)" })
keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "LSP: 重命名符号" })

-- ------------ 诊断相关 ------------- --
keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: 跳转到定义" })
keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: 跳转到声明" })
keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP: 跳转到实现" })
keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP: 查找引用" })
keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "LSP: 类型定义" })
