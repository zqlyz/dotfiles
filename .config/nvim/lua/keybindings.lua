-- 个人键位配置 --
vim.g.mapleader = ' '
local nore = { noremap = true }
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

nsmap('tl', '<cmd>HopLine<cr>')
nsmap('tw', '<cmd>HopWord<cr>')


nsmap('<F2>', '<cmd>NvimTreeToggle<cr>') -- tree
nsmap('<F3>', '<cmd>TroubleToggle<cr>') -- symbols_outline
nsmap('<F4>', '<cmd>lua vim.lsp.buf.document_symbol()<cr>') -- symbols_outline
