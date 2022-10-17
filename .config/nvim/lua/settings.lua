vim.o.wrap = false

-- 不换行
vim.o.termguicolors = true
-- 开启鼠标
vim.cmd [[set mousem=extend]]

-- utf-8
vim.o.encoding = 'utf-8'

-- 设置缩进大小
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- <C-v><tab>可以使用原始tab
vim.o.expandtab = true

-- 行列高亮，80列常亮
-- vim.wo.cursorline = true
-- vim.wo.cursorcolumn = true
vim.wo.colorcolumn = '80'

-- 使用相对行号
vim.o.number = true
vim.o.relativenumber = true

-- 高亮搜索
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true
