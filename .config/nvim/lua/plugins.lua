local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- 主题
  use 'navarasu/onedark.nvim'
  -- 目录树
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }
  -- 下面的line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  -- 快速文件查找
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  -- 语法高亮
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- lsp
  use {
    'williamboman/nvim-lsp-installer',
    'neovim/nvim-lspconfig',
  }

  -- auto complete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp', --neovim 内置 LSP 客户端的 nvim-cmp 源
      'hrsh7th/cmp-buffer', --从buffer中智能提示
      'hrsh7th/cmp-nvim-lua', --nvim-cmp source for neovim Lua API.
      'L3MON4D3/LuaSnip', --Snippets plugin
      'onsails/lspkind-nvim', -- 图标
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    }
  }
  use 'windwp/nvim-autopairs'

  -- bufferline, 显示已经打开的buffer在上面
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  --git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  -- 函数提示
  use 'ray-x/lsp_signature.nvim'

  --符号表，tags
  use 'simrat39/symbols-outline.nvim'

  -- vim 内 shell
  use {'akinsho/toggleterm.nvim', tag = 'v1.*', config = function()
    require("toggleterm").setup()
  end}

  -- Blinkline
  use 'lukas-reineke/indent-blankline.nvim'

  -- emmet (html plug)
  use 'mattn/emmet-vim'
  
  -- 注释
  use 'tpope/vim-commentary'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
