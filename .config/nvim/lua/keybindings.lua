-- 个人键位配置 --
vim.g.mapleader = ' '
local nore = { noremap = true }
local re = { noremap = false }
local slient = { noremap = true, silent = true }
local function nmap(key, map)
  vim.api.nvim_set_keymap('n', key, map, nore)
end

local function imap(key, map)
  vim.api.nvim_set_keymap('i', key, map, nore)
end

local function nsmap(key, map)
  vim.api.nvim_set_keymap('n', key, map, slient)
end

local function renmap(key, map)
  vim.api.nvim_set_keymap('n', key, map, re)
end

local function revmap(key, map)
  vim.api.nvim_set_keymap('v', key, map, re)
end

-- c-s to save file
nmap('<c-s>', '<cmd>w<CR>')
imap('<c-s>', '<Esc><cmd>w<CR>a')

-- m-j 是 alt + j
nmap('<m-up>', '<cmd>res +1<cr>')
nmap('<m-down>', '<cmd>res -1<cr>')
nmap('<m-left>', '<cmd>vertical resize -1<cr>')
nmap('<m-right>', '<cmd>vertical resize +1<cr>')

--treesitter
nsmap('<leader>p', '<cmd>Telescope find_files<cr>')
nsmap('<leader>o', '<cmd>Telescope live_grep<cr>')
nsmap('<leader>i', '<cmd>Telescope help_tags<cr>')
-- bufferline
nsmap('<c-pageup>', '<cmd>BufferLineCyclePrev<cr>')
nsmap('<c-pagedown>', '<cmd>BufferLineCycleNext<cr>')

-- motion
-- nsmap('fl', '<cmd>HopLine<cr>')
nsmap('s', '<cmd>HopChar1<cr>')

nsmap('<leader>/', '<cmd>nohlsearch<cr>')
-- lsp keybindings in configs/nvim-lsp.lua, not here.
-- toggletrem keybindings in configs/toggletrem.lua, not here.
-- gitsigns keybindings in configs/gitsigns.ula, not here



nsmap('<F2>', '<cmd>NvimTreeToggle<cr>') -- tree
nsmap('<F3>', '<cmd>SymbolsOutline<cr>') -- symbols_outline
nsmap('<F4>', '<cmd>TroubleToggle<cr>')
nsmap('<F5>', '<cmd>lua require"dap".continue()<cr>')
nsmap('<F6>',
  '<cmd>lua require"dap".disconnect({ restart = false, terminateDebuggee = null }, require"dapui".close())<cr>')

nsmap('<F10>', '<cmd>lua require"dap".step_over()<cr>')
nsmap('<F11>', '<cmd>lua require"dap".step_into()<cr>')
nsmap('<F12>', '<cmd>lua require"dap".step_out()<cr>')

-- leader key
-- vim window size
nmap('<leader>h', '<c-w>h')
nmap('<leader>j', '<c-w>j')
nmap('<leader>k', '<c-w>k')
nmap('<leader>l', '<c-w>l')
nmap('<leader>H', '<c-w>H')
nmap('<leader>J', '<c-w>J')
nmap('<leader>K', '<c-w>K')
nmap('<leader>L', '<c-w>L')

-- Breakpoint
nsmap('<F9>', '<cmd>lua require"dap".toggle_breakpoint()<cr>')

local wk = require('which-key')

wk.register({
  ["j"] = "which_key_ignore",
  ["h"] = "which_key_ignore",
  ["k"] = "which_key_ignore",
  ["l"] = "which_key_ignore",
  ["J"] = "which_key_ignore",
  ["H"] = "which_key_ignore",
  ["K"] = "which_key_ignore",
  ["L"] = "which_key_ignore",
  ["b"] = "Toggle Breakpoint",
}, { mode = 'n', prefix = '<leader>' })

wk.register({}, { mode = 'n', prefix = 'f' })

vim.cmd [[imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']]
vim.cmd [[smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>']]
