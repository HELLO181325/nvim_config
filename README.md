# nvim-config

基于 [lazy.nvim](https://github.com/folke/lazy.nvim) 包管理器的 Neovim 配置。

## 目录结构

```
nvim/
├── init.lua                  # 入口文件
├── lazy-lock.json            # 插件版本锁定
├── lua/
│   ├── core/
│   │   ├── basic.lua         # 基础编辑器设置
│   │   ├── keymap.lua        # 快捷键映射
│   │   └── lazy.lua          # lazy.nvim 引导与插件加载
│   └── plugins/
│       ├── blink.lua         # 补全引擎
│       ├── bufferline.lua    # 缓冲区标签栏
│       ├── grug-far.lua      # 查找替换
│       ├── hop.nvim.lua      # 快速跳转
│       ├── indent-blankline.lua # 缩进对齐线
│       ├── lualine.lua       # 状态栏
│       ├── mason.lua         # LSP 管理
│       ├── nvim-autopairs.lua   # 自动配对括号
│       ├── nvim-surround.lua    # 环绕操作
│       ├── nvim-tree.lua     # 文件树
│       ├── telescope.lua     # 模糊查找
│       └── theme.lua         # 主题配色
```

## 安装

### 依赖

- Neovim >= 0.9
- Git
- [Nerd Font](https://www.nerdfonts.com/)（可选，用于图标显示）
- 以下 LSP 相关的系统依赖：
  - Lua Language Server

### 安装步骤

```bash
# 克隆到 Neovim 配置目录
git clone https://github.com/<your-username>/nvim-config.git ~/.config/nvim

# Windows 下为：
git clone https://github.com/<your-username>/nvim-config.git $env:LOCALAPPDATA\nvim

# 启动 Neovim，lazy.nvim 将自动安装所有插件
nvim
```

首次启动时会自动安装 lazy.nvim 及所有插件。

## 插件列表

| 插件 | 说明 |
|------|------|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | 现代化的插件管理器 |
| [blink.cmp](https://github.com/saghen/blink.cmp) | 高性能自动补全引擎，支持 LSP/路径/片段/缓冲区源 |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | 顶部缓冲区标签栏，集成 LSP 诊断信息 |
| [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim) | 项目级查找与替换工具 |
| [hop.nvim](https://github.com/smoka7/hop.nvim) | 快速跳转，减少重复按键 |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | 缩进对齐线，增强代码结构可视化 |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | 美观快速的状态栏 |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/DAP/Linter/Formatter 统一管理，已配置 Lua LSP |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | 自动闭合括号、引号等 |
| [nvim-surround](https://github.com/kylechui/nvim-surround) | 快速添加/修改/删除环绕字符（括号、引号等） |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | 侧边栏文件树浏览器 |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | 强大的模糊查找器（集成 fzf-native） |
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Tokyo Night 主题（moon 风格） |

## 快捷键

> `<leader>` 键为空格（` `）

### 基础操作

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `jk` | 插入模式 | 退出到正常模式 |
| `<leader>nh` | 正常模式 | 取消搜索高亮 |

### 窗口管理

| 快捷键 | 说明 |
|--------|------|
| `<leader>sv` | 水平分割窗口 |
| `<leader>sh` | 垂直分割窗口 |

### 缓冲区管理

| 快捷键 | 说明 |
|--------|------|
| `<leader>bh` | 切换到上一个缓冲区 |
| `<leader>bl` | 切换到下一个缓冲区 |
| `<leader>bd` | 关闭当前缓冲区 |
| `<leader>bo` | 关闭其他缓冲区 |
| `<leader>bp` | 选择缓冲区 |
| `<leader>bc` | 选择并关闭缓冲区 |

### 文本移动

| 快捷键 | 模式 | 说明 |
|--------|------|------|
| `J` | 可视模式 | 将选中行下移一行 |
| `K` | 可视模式 | 将选中行上移一行 |

### 文件树

| 快捷键 | 说明 |
|--------|------|
| `<leader>uf` | 切换文件树显示 |

### 快速跳转

| 快捷键 | 说明 |
|--------|------|
| `<leader>hp` | 跳转到单词 |

### Telescope

使用 `:Telescope` 命令访问以下常用功能：

| 命令 | 说明 |
|------|------|
| `:Telescope find_files` | 查找文件 |
| `:Telescope live_grep` | 实时文本搜索 |
| `:Telescope buffers` | 浏览打开的缓冲区 |
| `:Telescope help_tags` | 搜索帮助文档 |

### Grug-Far（查找替换）

| 命令 | 说明 |
|------|------|
| `:GrugFar` | 打开全局查找替换界面 |

## 编辑器设置

| 配置项 | 值 | 说明 |
|--------|-----|------|
| 行号 | 相对 + 绝对 | 当前行显示绝对行号，其余显示相对行号 |
| 缩进宽度 | 4 空格 | Tab 转换为空格 |
| 自动换行 | 关闭 | 长行不自动折行 |
| 颜色列 | 80 字符处 | 标记推荐行宽 |
| 光标行 | 高亮 | 当前行高亮 |
| 鼠标 | 启用 | 所有模式支持鼠标 |
| 系统剪贴板 | 启用 | 与系统剪贴板互通（unnamedplus） |
| 搜索 | 智能大小写 | 小写时忽略大小写，含大写时区分 |
| 主题 | tokyonight (moon) | 深色主题 |
| 自动加载 | 启用 | 外部修改自动重新加载 |
