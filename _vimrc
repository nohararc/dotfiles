"エンコーディング
set encoding=utf-8              "vimの内部文字コードを変更
set termencoding=utf-8          "vimのターミナルの文字コードを変更
set fileencoding=utf-8          "ファイルの書き込み時の文字コードを変更
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp    "ファイル読み込み時の文字コードを変更
scriptencoding utf-8

"vim-plug
call plug#begin('$VIM/plugins/vim-plug')
Plug 'junegunn/vim-plug'
Plug 'thinca/vim-quickrun'
"Plug 'davidhalter/jedi-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'itchyny/lightline.vim'
Plug 'w0ng/vim-hybrid'
Plug 'cocopon/lightline-hybrid.vim'
Plug 'h1mesuke/vim-alignta'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-surround'
Plug 'PProvost/vim-ps1'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'thinca/vim-fontzoom'
Plug 'KKPMW/moonshine-vim'
Plug 'tomasr/molokai'
Plug 'othree/yajs.vim'
call plug#end()


"ここから基本設定
set history=100 "コマンド履歴を100まで記憶
set ruler    "カーソル位置を表示
set autoindent    "自動でインデント
set smartindent    "新しい行を開始したときにインデントを同じにする
set nonumber      "行番号を非表示
set laststatus=2    "常にステータス行を表示
set cmdheight=1     "コマンドラインの高さ
set foldcolumn=1    "左余白を確保

"特殊文字の見え方
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
"全角スペースをハイライト
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

colorscheme molokai

"backspaceキーの挙動設定
    "indent 行頭の空白の削除を許す
    "eol    改行の削除を許す
    "start  挿入モードの開始位置での削除を許す
set backspace=indent,eol,start

set tabstop=4       "tab文字の画面上何文字で表示するか
set shiftwidth=4    "自動インデントの際に挿入されるタブの幅
set expandtab       "tabの代わりに空白文字を指定

set backupdir=$VIM/backup   "バックアップファイルのディレクトリ指定
set directory=$VIM/backup   "バックアップファイルのディレクトリ指定
set undodir=$VIM/backup     "Undoファイルのディレクトリ指定

set hidden      "変更中のファイルを保存なしで切り替える

set clipboard+=unnamed  "クリップボードを共有

"検索関連
set incsearch   "インクリメントサーチを行う 
set ignorecase  "大文字/小文字を区別しない
set smartcase   "検索文字列に大文字が含まれている場合は区別
set wrapscan    "検索時に最後まで戻ったら

set showmatch   "閉じ括弧が入力されたときに対応する括弧を強調する
set matchtime=1 "対応する括弧を強調する時間(0.x秒単位)
set textwidth=0 "自動改行無効
set cursorline  "現在編集中の行を強調表示

"jedi-vim関連
let g:jedi#auto_initialization = 1
let g:jedi#rename_command = ""
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = "<C-Space>"
autocmd FileType python let b:did_ftplugin = 1

"quickrun関連
"pythonはcp932で返してくるのでそれように出力文字コードを設定
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config = {
\   "_" : {
\       'runner'    : 'vimproc',
\       'runner/vimproc/updatetime' : 100,
\       'outputter' : 'error',
\       'outputter/error/success' : 'buffer',
\       'outputter/error/error'   : 'quickfix',
\       'outputter/buffer/split': ':botright 8sp',
\       'outputter/buffer/close_on_empty' : 1,
\   },
\   "python" : {
\       "hook/output_encode/enable" : 1,
\       "hook/output_encode/encoding" : "cp932",
\   },
\   "tcl" : {
\       "command" : "tclsh"
\   },
\}

"vim-indent-guides関連
let g:indent_guides_enable_on_vim_startup=1 "vim起動時に有効にする
let g:indent_guides_start_level=2           "ガイドを開始するタブの数
let g:indent_guides_guide_size=1            "ガイドのサイズ
"indentに付ける色
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black     "奇数
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray  "偶数

"lightline関連
let g:lightline = {
    \ 'colorscheme': 'hybrid',
    \ }

"vim-alignta関連
let g:alignta_default_arguments = "|"

"ctrlpvim関連
nnoremap <silent> <Space>pm :<C-u>CtrlPMRUFiles<CR>
nnoremap <silent> <Space>pb :<C-u>CtrlPBuffer<CR>
nnoremap <silent> <Space>pf :<C-u>CtrlPCurFile<CR>
nnoremap <silent> <Space>pl :<C-u>CtrlPLine<CR>

"キーマップ変更
nnoremap <silent> <Space>wv :<C-u>rightbelow vnew<CR>   "ウィンドウを右に作る
nnoremap <Space>h ^
nnoremap <Space>l $
nnoremap <Space>m %
nnoremap <Space>ww <C-w><C-w>
nnoremap <Space>wh <C-w>h
nnoremap <Space>wl <C-w>l
nnoremap <Space>wj <C-w>j
nnoremap <Space>wk <C-w>k
nnoremap <Space>wH <C-w>H
nnoremap <Space>wL <C-w>L
nnoremap <Space>wJ <C-w>J
nnoremap <Space>wK <C-w>K
nnoremap <Space>w- <C-w>=
nnoremap Y y$

nnoremap <silent> <Space>e :<C-u>silent! !explorer %:h<CR>
