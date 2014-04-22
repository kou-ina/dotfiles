set nocompatible

if has('vim_starting')
  filetype plugin off
  filetype indent off
  execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
endif
call neobundle#rc(expand('~/.vim/bundle'))

NeoBundle 'git://github.com/kien/ctrlp.vim.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/scrooloose/syntastic.git'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'altercation/vim-colors-solarized'

filetype plugin on
filetype indent on

"---------------------------------------------------------------------
" snippet setting
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
"---------------------------------------------------------------------

"表示設定
set number "行番号を表示する
set nocompatible
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
set tabstop=4 "インデントをスペース4つ分に設定
set expandtab "タブ入力を複数の空白入力に置き換える
set shiftwidth=4 "自動インデントでずれる幅
set autoindent "オートインデント
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set backspace=start,eol,indent "backspace setting
set t_Co=256
set laststatus=2

"スキーマ設定
syntax enable
set background=dark
"set background=light
let g:solarized_termcolors=256
colorscheme solarized
autocmd BufNewFile,BufRead *.twig set syntax=htmldjango "twig syntax

"検索設定
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"基本設定
set noswapfile      " スワップファイルを作らない
set showcmd         " 入力したコマンドをステータスラインに表示
set vb t_vb=        " ビープを鳴らさない
