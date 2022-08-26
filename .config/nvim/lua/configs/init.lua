-- 基础插件
vim.notify = require('notify') -- notify

-- ui
require('onedark').setup {
  style = 'dark'
}
require('onedark').load()
require('colorizer').setup {
  '*';
}
require('configs/gitsigns') -- gitsigns
-- Blinkline
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
vim.opt.list = true
require("indent_blankline").setup {
  space_char_blankline = " ",
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6"
  },
}
require 'lualine'.setup {
  options = { theme = 'onedark' },
}
require('which-key').setup {}
require('todo-comments').setup {}
require("trouble").setup {}
require('symbols-outline').setup {}
require('bufferline').setup {}


-- finding
require('nvim-tree').setup {}
require('telescope').setup {}
require('nvim-lastplace').setup {} -- lastplace
require('hop').setup {}

-- 语法高亮
require('configs/nvim-treesitter')


-- 补全
require('configs/nvim-lsp')
require('nvim-autopairs').setup {} -- autopairs

require('configs/toggleterm') -- vim内终端
require('nvim_comment').setup {} -- 注释

-- debugger
require('configs/nvim-dap')
require("nvim-dap-virtual-text").setup {}
require("dapui").setup {}
require('telescope').setup {}
require('telescope').load_extension('dap')
