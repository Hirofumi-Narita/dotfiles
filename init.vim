" start dein script------------
if &compatible
  set nocompatible
endif

" dein 本体
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" plugin 読み込み
if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')  

  call dein#add('Shougo/dein.vim')
  call dein#add('y-uuki/perl-local-lib-path.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('Shougo/deoplete.nvim')

  call dein#end()
endif

filetype plugin indent on
syntax enable

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
" end dein script------------

" deoplete.nvim
let g:python_host_prog = '/Users/narita/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/narita/.pyenv/versions/neovim3/bin/python'
let g:deoplete#enable_at_startup = 1

" lightline.vim
if !has('gui_running')
  set t_Co=256
  endif

"perl-local-lib-path.vim
autocmd FileType perl PerlLocalLibPath

" setting
" エンコード設定
set encoding=utf-8
" ペーストを有効
set paste
" 行を跨いで移動
set whichwrap=h,l
" 検索をリアルタイムにする
set incsearch
" 検索結果をハイライト
set hlsearch
" 改行させる
"set nowrap
" 検索を先頭に戻って行う
set wrapscan

" view
" シンタックスを有効にする
syntax on
" 入力中のコマンド表示
set showcmd
" 行番号表示
set number   
" カーソル行の背景色
set cursorline
" ステータス行を常に表示
set laststatus=2
" メッセージ欄を2行確保
set cmdheight=2
" 対応する括弧強調
set showmatch
" カーソルの位置表示
set ruler
" 行番号の色を白
highlight LineNr ctermfg=255

" indent
" tabを空白入力にする
set expandtab
" tabの空白数
set tabstop=4
" インデント時の文字数
set shiftwidth=4

" ファイルのシンタックス設定
augroup filetypedetect
  autocmd BufNewFile,BufRead *.psgi   set filetype=perl
  autocmd BufNewFile,BufRead *.t      set filetype=perl
  autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
augroup END
