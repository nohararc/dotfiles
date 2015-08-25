"エンコーディング
set encoding=utf-8              "vimの内部文字コードを変更
set termencoding=utf-8          "vimのターミナルの文字コードを変更
set fileencoding=utf-8          "ファイルの書き込み時の文字コードを変更
set fileencodings=utf-8,cp932,euc-jp    "ファイル読み込み時の文字コードを変更
scriptencoding utf-8

"neobundle
"NeoBundle本体を$VIM\bundle配下に配置
"winの場合はGitコマンドへのパスを通さないとインストールされないので注意(再起動後に反映)
set nocompatible               "vi互換を消去
filetype off                   " おまじない

if has('vim_starting')
 set runtimepath+=$VIM\bundle\neobundle.vim
endif

call neobundle#begin(expand('$VIM\bundle'))
NeoBundleFetch 'Shogo/neobundle.vim'
"ここからプラグイン名を書いていく
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundleCheck
call neobundle#end()

filetype plugin indent on     "おまじない
syntax on

"ここから基本設定
set history=100 "コマンド履歴を100まで記憶
set ruler    "カーソル位置を表示
set autoindent    "自動でインデント
set smartindent    "新しい行を開始したときにインデントを同じにする
set number      "行番号を表示

" デフォルトvimrc_exampleのtextwidth設定上書き、改行しない設定に
autocmd FileType text setlocal textwidth=0

"特殊文字の見え方
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
"全角スペースをハイライト
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

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

"vimfiler関連
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> ,vf :<C-u>VimFiler -split -simple -winwidth=40 -no-quit<CR>

"jedi-vim関連
let g:jedi#auto_initialization = 1
let g:jedi#rename_command = ""
let g:jedi#popup_on_dot = 1
autocmd FileType python let b:did_ftplugin = 1

"quickrun関連
"pythonはcp932で返してくるのでそれように出力文字コードを設定
let g:quickrun_config = {
\   "python" : {
\      "hook/output_encode/enable" : 1,
\      "hook/output_encode/encoding" : "cp932",
\   },
\}

"vim-indent-guides関連
let g:indent_guides_enable_on_vim_startup=1 "vim起動時に有効にする
let g:indent_guides_start_level=2           "ガイドを開始するタブの数
let g:indent_guides_guide_size=1            "ガイドのサイズ
"indentに付ける色(なぜかIndentGuidesOdd[Even] ctermbgでは色が変わらない)
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#444433 ctermbg=black     "奇数
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#333344 ctermbg=darkgray  "偶数

"unite関連
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>        "現在のバッファを表示
nnoremap <silent> ,ut :<C-u>Unite tab<CR>           "現在のタブを表示
nnoremap <silent> ,uf :<C-u>Unite file<CR>          "カレントディレクトリを開く
nnoremap <silent> ,un :<C-u>Unite neomru/file<CR>   "過去開いたファイルの一覧を取得

"コマンド定義
command! Todo edit ~\ToDo.txt   ":TodoでTodo.txtを編集

"キーマップ変更
nnoremap <silent> ,wv :<C-u>rightbelow vnew<CR>
nnoremap <silent> ,wc :<C-u>close<CR>
nnoremap Y y$

"Todo
"Uniteまわりを変更する
"vim-indent-guidesの色調整
