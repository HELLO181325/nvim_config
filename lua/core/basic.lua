local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"

--高亮当前行及最长长度
opt.cursorline = true
opt.cursorcolumn = false
opt.colorcolumn = "80"

--自动加载外部修改
opt.autoread = true

--查找过程中大小写敏感及查找高亮配置
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- 禁用lualine自带样式
opt.showmode = false
