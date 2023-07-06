require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "lua", "vim", "javascript", "typescript", "html", "css", "python", "java", "kotlin"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  highlight = {
    enable = true,

   additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
--vim.wo.foldmethod = 'expr'
--vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
