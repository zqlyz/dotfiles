-- 不换行
vim.wo.wrap = false

-- utf-8
vim.o.encoding = 'utf-8'

-- 设置缩进大小
vim.bo.softtabstop = 2
vim.bo.shiftwidth = 2
-- 用空格代替tab, 取消为noexpandtab
vim.bo.expandtab = true

-- 行列高亮，80列常亮
vim.wo.cursorline = true
vim.wo.colorcolumn = '80'

-- 使用相对行号
vim.o.number = true
vim.wo.relativenumber = true

-- 高亮搜索
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true
