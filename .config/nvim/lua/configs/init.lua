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



-- Indent Blankline
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }



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
