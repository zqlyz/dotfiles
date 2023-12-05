vim.o.wrap = false

-- 不换行
vim.o.termguicolors = true
-- 不开启鼠标
vim.cmd [[set mouse=]]

-- utf-8
vim.o.encoding = 'utf-8'

-- 设置缩进大小
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

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
