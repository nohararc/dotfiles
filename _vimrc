"エンコーディング
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp
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
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundleCheck
call neobundle#end()

filetype plugin indent on     "おまじない
syntax on

"ここから基本設定
set history=100 "コマンド履歴を100まで記憶
set ruler	"カーソル位置を表示
set autoindent	"自動でインデント
set smartindent	"新しい行を開始したときにインデントを同じにする

"backspaceキーの挙動設定
    "indent	行頭の空白の削除を許す
    "eol	改行の削除を許す
    "start	挿入モードの開始位置での削除を許す
set backspace=indent,eol,start	

set tabstop=4	"tab文字の画面上何文字で表示するか
set shiftwidth=4	"自動インデントの際に挿入されるタブの幅
set expandtab		"tabの代わりに空白文字を指定

set backupdir=$VIM/backup	"バックアップファイルのディレクトリ指定
set directory=$VIM/backup	"バックアップファイルのディレクトリ指定
set undodir=$VIM/backup   "Undoファイルのディレクトリ指定

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

"vimshell関連
let g:vimshell_prompt_expr = 'getcwd()." > "'   "カレントディレクトリを表示

"vimfiler関連
let g:vimfiler_enable_auto_cd = 1
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> ,vf :<C-u>VimFiler<CR>

"jedi-vim関連
let g:jedi#auto_initialization = 1
let g:jedi#rename_command = ""
let g:jedi#popup_on_dot = 1
autocmd FileType python let b:did_ftplugin = 1

"vim-indent-guides関連
let g:indent_guides_enable_on_vim_startup=1 "vim起動時に有効にする
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=110
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140

"unite関連
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>Unite neomru/file<CR>
nnoremap <silent> ,ut :<C-u>Unite tab<CR>

"コマンド定義
command! Todo edit ~\ToDo.txt   ":TodoでTodo.txtを編集


"Todo
"Uniteまわりを変更する
"衝突しないようなキーバインドにする
"現在マッピングされているキーバインドを調べるコマンドを調べる
"vim-indent-guidesの色調整
"
