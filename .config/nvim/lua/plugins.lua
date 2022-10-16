local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
end
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- 基础插件
  use 'nvim-lua/plenary.nvim' --为下面的插件提供api
  use 'rcarriga/nvim-notify' --右上角通知
  use 'kyazdani42/nvim-web-devicons' -- 各种图标

  -- ui
  use 'navarasu/onedark.nvim' -- 主题
  use 'norcalli/nvim-colorizer.lua'
  use 'lewis6991/gitsigns.nvim' --git
  use 'ray-x/lsp_signature.nvim' -- 函数提示
  use 'lukas-reineke/indent-blankline.nvim' -- Blinkline
  use 'nvim-lualine/lualine.nvim' -- 下面的line
  use 'folke/which-key.nvim' -- 快捷键
  use 'folke/todo-comments.nvim' -- TODO : todo highlight
  use 'folke/trouble.nvim' -- 下面栏
  use 'simrat39/symbols-outline.nvim' --symbol
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*'
  }

  -- finding
  use 'kyazdani42/nvim-tree.lua' -- 目录树
  use 'nvim-telescope/telescope.nvim' -- 快速文件查找
  use 'ethanholz/nvim-lastplace' --上一次位置
  use {
    'phaazon/hop.nvim', -- esay motion
    branch = 'v2'
  }
  use 'andymass/vim-matchup'

  -- 语法高亮
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-context'

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
      'rafamadriz/friendly-snippets',
      'onsails/lspkind-nvim', -- 图标
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip'
    }
  }

  use 'windwp/nvim-autopairs'

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'


  -- vim 内 shell
  use { 'akinsho/toggleterm.nvim', tag = 'v1.*', config = function()
    require("toggleterm").setup()
  end }

  -- debugger
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'

  use 'terrortylor/nvim-comment'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
