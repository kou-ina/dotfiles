"Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set showtabline=2
set noshowmode

if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible    
    endif

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Townk/vim-autoclose' " 括弧自動保管
NeoBundle 'mattn/emmet-vim' " Emmet
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'sjl/badwolf' " color scheme

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

"nerdtree 設定
" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1  
" デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'

" 表示設定
set number " 行番号を表示する
set nocompatible
"set title " 編集中のファイル名を表示
set showmatch " 括弧入力時の対応する括弧を表示
set tabstop=4 " インデントをスペース4つ分に設定
set expandtab " タブ入力を複数の空白入力に置き換える
set shiftwidth=4 " 自動インデントでずれる幅
"set autoindent " オートインデント
set backspace=start,eol,indent "backspace setting
set t_Co=256
set laststatus=2

" カラー設定
syntax on
colorscheme badwolf
highlight Normal ctermbg=none

" 検索設定
set ignorecase " 大文字/小文字の区別なく検索する
set smartcase  " 検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan   " 検索時に最後まで行ったら最初に戻る

" 基本設定
set noswapfile " スワップファイルを作らない
set showcmd    " 入力したコマンドをステータスラインに表示
set vb t_vb=   " ビープを鳴らさない

" 全角スペース表示
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme * call ZenkakuSpace()
		autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
	augroup END
	call ZenkakuSpace()
endif
