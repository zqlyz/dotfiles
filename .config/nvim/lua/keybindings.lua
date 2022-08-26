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

-- vim window size
nmap('<leader><up>',    '<cmd>res +5<cr>')
nmap('<leader><down>',  '<cmd>res -5<cr>')
nmap('<leader><left>',  '<cmd>vertical resize -5<cr>')
nmap('<leader><right>', '<cmd>vertical resize +5<cr>')

--treesitter
nsmap('ff', '<cmd>Telescope find_files<cr>')
nsmap('fg', '<cmd>Telescope live_grep<cr>')
--nsmap('fb', '<cmd>Telescope buffers<cr>')
--nsmap('fh', '<cmd>Telescope help_tags<cr>')

-- motion
nsmap('fl', '<cmd>HopLine<cr>')
nsmap('fw', '<cmd>HopWord<cr>')

-- lsp keybindings in configs/nvim-lsp.lua, not here.
-- toggletrem keybindings in configs/toggletrem.lua, not here.
-- gitsigns keybindings in configs/gitsigns.ula, not here


nsmap('<F2>', '<cmd>NvimTreeToggle<cr>') -- tree
nsmap('<F3>', '<cmd>SymbolsOutline<cr>') -- symbols_outline
nsmap('<F4>', '<cmd>TroubleToggle<cr>')
nsmap('<F5>', '<cmd>lua require"dap".continue()<cr>')
nsmap('<F6>', '<cmd>lua require"dap".disconnect({ restart = false, terminateDebuggee = null }, require"dapui".close())<cr>')

nsmap('<F10>', '<cmd>lua require"dap".step_over()<cr>')
nsmap('<F11>', '<cmd>lua require"dap".step_into()<cr>')
nsmap('<F12>', '<cmd>lua require"dap".step_out()<cr>')


nsmap('<leader>b', '<cmd>lua require"dap".toggle_breakpoint()<cr>')
nsmap('<leader>B', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>')
