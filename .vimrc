" 使用vim 模式
set nocompatible

" 设置中文帮助文档
set helplang=cn

" 设定utf-8编码 
set encoding=utf-8

" 设置修改提示
set confirm

" 显示输入命令和行列
set showcmd
set ruler

" 命令补全显示选择栏
set wildmenu

" 在搜索范围中加入子文件夹路径 
set path+=**

" 设置缩进大小
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 用空格代替tab, 取消为noexpandtab
set expandtab

" 不要换行
set nowrap

" 行列高亮
" highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
set cursorline 
"set cursorcolumn

"使用相对行号
set nu
set relativenumber




" Vundle插件加载
" =============================
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'

Plugin 'jiangmiao/auto-pairs'

Plugin 'vim-airline/vim-airline'

Plugin 'scrooloose/nerdtree'

Plugin 'Xuyuanp/nerdtree-git-plugin'
call vundle#end()            " required
filetype plugin indent on    " required
"==============================

" NERDTree 配置, 设置F3为开关按键
nnoremap <F3> :NERDTreeToggle<CR>
" 当只有NERDTree的时候自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 语法高亮 
syntax enable
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
