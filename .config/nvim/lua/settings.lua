-- 不换行
vim.o.wrap = false

-- utf-8
vim.o.encoding = 'utf-8'

-- 设置缩进大小
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

-- <C-v><tab>可以使用原始tab
vim.o.expandtab = true

-- 行列高亮，80列常亮
vim.wo.cursorline = true
vim.wo.cursorcolumn = true
vim.wo.colorcolumn = '80'

-- 不使用相对行号
vim.o.number = true
vim.o.relativenumber = false

-- 高亮搜索
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true
