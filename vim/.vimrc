set nocompatible              " be improved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Colour-Sampler-Pack'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-latex/vim-latex'
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()            " required
filetype plugin on           " required

"------------------Non-Plugin stuff----------------------
set nu			"show line number
syntax on		"check syntax
set ruler		"status bar

set fileencoding=utf-8		"save file with utf-8
set encoding=utf-8		"show the file with utf-8
set termencoding=utf-8	"auto convert to utf-8

set hlsearch 		"search highlight
set nocompatible	"no compatible with vi
set autoindent		"auto indent
set nobackup		"no backup

" configure tabwidth and insert spaces instead of tabs
set tabstop=2        	"tab width is 4 spaces(半形,half-widthform)
set shiftwidth=2     	"autoshift how many spaces in the next line
set expandtab        	"expand tabs to spaces

" turn syntax highlighting on
set t_Co=256		"vim can used only 16 colors at first, change it to 256 colors
set showmatch		"match the same brackets with same color

set comments=sl:/*,mb:*,el:*/,:// "comments
set backspace=indent,eol,start "OSX only since delete cannot use

let maplocalleader = ","

autocmd filetype html,c,cpp,javascript,java,css,python,r :inoremap ( ()<ESC>i
autocmd filetype html,c,cpp,javascript,java,css,python,r :inoremap ) <c-r>=ClosePair(')')<CR>
autocmd filetype html,c,cpp,javascript,java,css,python,r :inoremap [ []<ESC>i
autocmd filetype html,c,cpp,javascript,java,css,python,r :inoremap ] <c-r>=ClosePair(']')<CR>
autocmd filetype html,c,cpp,javascript,java,css,python,r :inoremap " ""<ESC>i
autocmd filetype html,c,cpp,javascript,java,css,python,r :inoremap ' ''<ESC>i

autocmd filetype c,cpp,java :inoremap { {<CR>}<ESC>O
autocmd filetype c,cpp,java,css :inoremap } <c-r>=ClosePair('}')<CR>
autocmd filetype html,javascript,css,r,tex :inoremap { {}<ESC>i

function! ClosePair(char)
  return a:char
endfunction

"-----------------YouCompleteMe-----------------
let g:ycm_server_use_vim_stdout = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_show_diagnostics_ui = 0
"-----------------for nerdcommenter-----------------
nmap aa <leader>c<space>
vmap a <leader>c<space>
nnoremap <expr> v:count == 0 ? '':v:count.'aa'
"-----------------------theme-----------------------
autocmd filetype cpp :colorscheme wood
autocmd filetype c :colorscheme wood
autocmd filetype html :colorscheme wood
autocmd filetype javascript :colorscheme wood
autocmd filetype python :colorscheme wood
autocmd filetype r :colorscheme rdark
"-------------airline settings------------------
set laststatus=2
"-------------ctrlp settings--------------------
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*.tmp,*.swp

"switch tab
imap <C-Z> <ESC>gTi
map <C-Z> gT
imap <C-X> <ESC>gti
map <C-X> gt

imap <C-P> <ESC><C-P>
"--------------html indent settings-------------
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
"-----------------nerd tree---------------------
map <C-H> :NERDTreeToggle<CR>
inoremap <C-H> <ESC>:NERDTreeToggle<CR>
"-----------------latex-------------------------
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor = 'latex'
autocmd filetype tex imap ∫ <Plug>Tex_MathBF
autocmd filetype tex imap ç <Plug>Tex_MathCal
autocmd filetype tex imap ¬ <Plug>Tex_LeftRight
autocmd filetype tex imap ˆ <Plug>Tex_InsertItemOnThisLine
"-----------latex live preview------------------
autocmd filetype tex setl updatetime=1000
let g:livepreview_previewer = 'open -a Skim'
let g:livepreview_engine = 'xelatex'
let g:Tex_CompileRule_pdf = 'xelatex --interaction=nonstopmode $*'
let g:Tex_PromptedEnvironments = 'equation,equation*,align,align*,enumerate,itemize,figure,table,cases,bmatrix'
autocmd filetype tex :LLPStartPreview
nmap <F6> :LLPStartPreview<CR>
imap <F6> <ESC>:LLPStartPreview<CR>
let g:vim_root = '~/dotfiles/rc'
func! LatexHelp()
  exec '!open -a Preview ' . g:vim_root . '/vim-latex.pdf'
endfunc

"-----------------------------------------------

nnoremap h 5h
nnoremap j 5j
nnoremap k 5k
nnoremap l 5l

inoremap <C-v> <ESC><S-v>
"map C-E threetimes of origin C-E
inoremap <C-e> <ESC>3<C-e>i
nnoremap <C-e> 3<C-e>
inoremap <C-y> <ESC>3<C-Y>i
nnoremap <C-y> 3<C-y>
"map ctrl+o with ESC
imap <C-F> <ESC>
map <C-F> i
"recover
imap <C-D> <ESC>ui
nmap <C-D> u

"redo
imap <C-R> <ESC><C-R>i

"Under insert mode,shift to different file by pressing ctrl+direction
imap <M-RIGHT> <ESC><C-W><RIGHT>i
imap <M-LEFT> <ESC><C-W><LEFT>i
imap <M-UP> <ESC><C-W><UP>i
imap <M-DOWN> <ESC><C-W><DOWN>i
nmap <M-RIGHT> <C-W><RIGHT>
nmap <M-LEFT> <C-W><LEFT>
nmap <M-UP> <C-W><UP>
nmap <M-DOWN> <C-W><DOWN>

" add date
imap <F12> <ESC>:r! date<CR>kddo

"exit file
nmap <C-k> :q<CR>
imap <C-k> <ESC>:q<CR>

"save file
nmap <C-l> :w<CR>
imap <C-l> <ESC>:w<CR>i

function! ExecuteLeader(suffix)
  let l:leader = get(g:,"mapleader","\\")

  if l:leader == ' '
    let l:leader = '1' . l:leader
  endif

  execute "normal ".l:leader.a:suffix
endfunction

command! -nargs=1 NormLead call ExecuteLeader(<f-args>)

"compile program
"use :r to remove file extension name
"see expand()
imap <F8> <ESC>:call Compile()<CR>i
nmap <F8> :call Compile()<CR>
func! Compile()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %:r.out -Wall"
  elseif &filetype == 'cpp'
    exec "!g++ -std=c++11 % -o %:r.out -Wall"
  elseif &filetype == 'tex'
    :NormLead ll
  endif
endfunc

"run program
imap <F9> <ESC>:call Run()<CR>
nmap <F9> :call Run()<CR>
func! Run()
  if &filetype == 'c'
    exec "!./%:r.out"
  elseif &filetype == 'cpp'
    exec "!./%:r.out"
  endif
endfunc

