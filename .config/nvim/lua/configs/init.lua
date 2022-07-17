-- ondark
require('onedark').setup {
  style = 'warmer'
}
require('onedark').load()
require'lualine'.setup {
  options = { theme  = 'onedark' },
}
require'nvim-tree'.setup {
}
require('configs/nvim-treesitter')
require('configs/nvim-lsp')

require('telescope').setup {}
-- autopairs
require('nvim-autopairs').setup{}
-- bufferline
vim.opt.termguicolors = true
require('bufferline').setup{}
-- symbols-outline
require('symbols-outline').setup{}
-- gitsigns
require('configs/gitsigns')
-- vim内终端
require('configs/toggleterm')
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
    "IndentBlanklineIndent6",
  },
}
