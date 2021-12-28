-- ondark
require('onedark').setup()

require'lualine'.setup{
  options = { theme  = 'onedark' },
}
require('configs/nvim-tree')
require('configs/nvim-treesitter')
require('configs/nvim-lsp-installer')
require('configs/nvim-cmp')

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
vim.opt.list = true
require("indent_blankline").setup {
  show_current_context = true,
  show_current_context_start = true,
}
