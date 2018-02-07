"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

" dein.vim 本体
" Required:
set runtimepath+=/home/narita/.vim/dein/repos/github.com/Shougo/dein.vim
let s:dein_dir = expand('~/.vim/dein')

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  call dein#add('y-uuki/perl-local-lib-path.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('jacoborus/tender.vim')
  call dein#add('Haron-Prime/Antares')

" 設定終了
call dein#end()
call dein#save_state()
endif

filetype plugin indent on
syntax enable

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
"end dein Scripts-----------------------------

" Use deoplete.
let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#enable_at_startup = 1

" perl local path
let g:perl_local_lib_path = "vendor/lib"
autocmd FileType perl PerlLocalLibPath

" power color
if !has('gui_running')
set t_Co=256
endif

colorscheme antares

augroup filetypedetect
autocmd BufNewFile,BufRead *.psgi            set filetype=perl
autocmd BufNewFile,BufRead *.t               set filetype=perl
autocmd! BufNewFile,BufRead *.tt             set filetype=html
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
autocmd BufNewFile,BufRead *.coffee          set filetype=coffee
autocmd BufNewFile,BufRead *.tx              set filetype=tt2html
autocmd FileType {html,coffee,javascript}    setlocal sw=2 sts=2 ts=2 et
augroup END

" setting
" エンコード設定
set encoding=utf-8
" ペーストを有効
"set paste
" 行を跨いで移動
set whichwrap=h,l
" 改行させる
"set nowrap

" search
" 検索をリアルタイムにする
set incsearch
" 検索結果をハイライト
set hlsearch
" 検索を先頭に戻って行う
set wrapscan

" view
" シンタックスを有効にする
syntax on
" 入力中のコマンド表示
set showcmd
" 行番号表示
set number---
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
" 一行が長くても表示
set display=lastline
" 不可視文字を表示
set list
set listchars=tab:»-,trail:-,nbsp:%

" indent
" tabを空白入力にする
set expandtab
" tabの空白数
set tabstop=4
" インデント時の文字数
set shiftwidth=4

" keymap
" 行頭に移動
nnoremap <C-a> ^
" 行末に移動
nnoremap <C-s> $
" TABにて対応ペアにジャンプ
nnoremap <tab> %
vnoremap <tab> %
"検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"xでヤンクが上書きされないようにする
noremap PP "0p
noremap x "_x

set mouse=n

syntax on
highlight LineNr ctermfg=255

nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>
inoremap <tab> <C-n>

" key map
map <C-n> :NERDTreeToggle<CR>
map <C-u> :Denite file_rec<CR>
map <C-t> :tabnew ./<CR>

" set number key map
function Setnumber()
  if &number
    setlocal nonumber
    setlocal mouse=c
  else
    setlocal number
    setlocal mouse=n
  endif
endfunction
nnoremap <silent> <C-m> :call Setnumber()<CR>

