"-------------------------------------------
"基本設定
"-------------------------------------------
"Vi互換をオフ
set nocompatible
"クリップボードをWindowsと連携
set clipboard=unnamed
"文字コード
scriptencoding utf-8
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
"======================================
"NeoBundle
set nocompatible
filetype off

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim
 call neobundle#rc(expand('=/.vim/.bundle'))
endif

NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
NeoBundle 'https://github.com/Shougo/vimfiler.git'
NeoBundle 'https://github.com/Shougo/vimshell.git'
NeoBundle 'https://github.com/Shougo/vimproc.git'
NeoBundle 'https://github.com/vim-scripts/Align.git'
NeoBundle 'https://github.com/glidenote/memolist.vim.git'
NeoBundle 'https://github.com/kien/ctrlp.vim.git'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'tpope/vim-endwise.git'

filetype plugin on
filetype indent on

"-------------------------------------------------
" neocomplcache
"-------------------------------------------------
"neocomplcache有効化
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
"シンタックスをキャッシュする時の最少文字列長(デフォルト:4)
let g:neocomplcache_min_syntax_length = 3
" 改行で補完ウィンドウを閉じる
"inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-P>" : "\<S-TAB>"
" <C-h>や<BS>を押したときに確実にポップアップを削除します
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”

"-------------------------------------------
"エディタ基本設定
"-------------------------------------------
"カラースキーマ
"colorscheme color_blind
"シンタックスカラーリングを有効にする
syntax on
"行番号を表示する
set number
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"座標を表示する
set ruler


"-------------------------------------------
"インデント
"-------------------------------------------
"新しい行のインデントを現在行と同じにする
"set autoindent
"新しい行を作ったときに高度な自動インデントを行う
"(コメントアウト後のインデントが気に入らないので無効)
"set smartindent
set cindent


"-------------------------------------------
"タブ
"-------------------------------------------
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
"シフト移動幅
set shiftwidth=2
"タブの代わりに空白文字を挿入する
set expandtab
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab

"-------------------------------------------------
" タブページ
"-------------------------------------------------
set showtabline=1


"-------------------------------------------
"検索
"-------------------------------------------
"インクリメンタルサーチを行う
set incsearch
"ハイライト
set hlsearch
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
set nowrapscan

"-------------------------------------------
"表示
"-------------------------------------------
"カーソル行に下線表示
"set cursorline
":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black

"ステータスラインを常に表示
set laststatus=2
set statusline=%<%f\%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P
"ステータスライン時刻表示用
function! g:Date()
   return strftime("%x %H:%M")
endfunction
set statusline+=\ \%{g:Date()}

"-------------------------------------------------------------------------------
" Mapping <jump-tag>
"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  -
" cmap/cnoremap         -            -              @                  -
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------
" Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>
"ノーマルモード時タブを移動
nmap <Tab> gt
nmap <S-Tab> gT

"新規タブ
map <LEADER>t :tabnew<CR>

"NERDTree
nmap <silent> <C-e> :NERDTreeToggle<CR>
vmap <silent> <C-e> <ESC> :NERDTreeToggle<CR>

"-------------------------------------------
"その他
"-------------------------------------------
"ウィンドウを最大化して起動
au GUIEnter * simalt ~x
"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
set ambiwidth=double
"quickrun実行ウィンドウを右へ
set splitright

"vimスクロール高速化
set lazyredraw
set ttyfast
